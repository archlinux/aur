# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-stroke-glow-shadow
pkgver=1.5.2
pkgrel=1
pkgdesc="OBS plugin to provide efficient Stroke, Glow, and Shadow effects on masked sources"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-stroke-glow-shadow"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f7e88a284925c5d1ffc75569dc529df4f36469a94813eccba3f21899d189aa0dc91a09c6c7ddda2bd4f6b93c0301797ac6c73a6061d7e1274e5dbf6fc9f9f974')

build() {
  cmake -B build -S "$pkgbase-$pkgver" \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="-Wno-stringop-overflow" \
    -DLINUX_PORTABLE=OFF
  cmake --build build
}

package() {
  cmake --install build
}
