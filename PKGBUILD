# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-stroke-glow-shadow
pkgver=1.5.3
pkgrel=1
pkgdesc="OBS plugin to provide efficient Stroke, Glow, and Shadow effects on masked sources"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-stroke-glow-shadow"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b6daa6ea729cff822952c445f765d684b868587686b2dfa2182d67a856eabe353c6bc3f3760e63046b3505a7f19d777a3f2e3ce7dc08f2e44de4e43bfdc9dafc')

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
