# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-stroke-glow-shadow
pkgver=1.0.2
pkgrel=2
pkgdesc="OBS plugin to provide efficient Stroke, Glow, and Shadow effects on masked sources"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-stroke-glow-shadow"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0ed9980e9eaf2b2502068b3cc7fd471a0037570313f22be2c25b7d1f07ed0dd522e8ee43f1bf0dd63e478db88048abf9d1dec0f7afc7155b1d722233eefa76df')

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
