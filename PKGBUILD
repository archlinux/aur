# Maintainer: marlonn <marlonn.dev@proton.me>
pkgname=carafe
pkgver=0.1.3
pkgrel=1
pkgdesc='A KDE Plasma-native game launcher for Windows games via Proton/UMU'
arch=('x86_64')
url="https://github.com/SlowNicoFish/${pkgname}"
license=('MIT')
depends=(
  'qt6-base'
  'qt6-declarative'
  'kirigami'
  'kcoreaddons'
)

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SlowNicoFish/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5fac1df239776b5b106ba2d9320b37b7b5e355f0cd5fd8acc0527ee391ba96ee')
build() {
  cmake -S "$srcdir/${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
