# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-composite-blur
pkgver=1.0.0
pkgrel=1
pkgdesc="Comprehensive blur plugin for OBS that provides several different blur algorithms, and proper compositing"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-composite-blur"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ae2cdd4d650fd44715f8bf20efa96a0c12bb3a498f0566d4238facb468e1b8fb2ba57361cf42cf28b2d8fb2bd09035f6ad4ffa32d6dce938ee201363fd3e3674')

build() {
  cmake -B build -S "$pkgbase-$pkgver" \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
  cmake --install build

  # Remove duplicate shared library
  rm -rf "$pkgdir"/usr/obs-plugins

  # Relocate files from /usr/data/ to /usr/share/obs/
  rm -rf "$pkgdir"/usr/share/obs/*
  mv -f "$pkgdir"/usr/data/* "$pkgdir"/usr/share/obs/
  rm -rf "$pkgdir"/usr/data
}
