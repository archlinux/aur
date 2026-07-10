# Maintainer: marlonn <marlonn.dev@proton.me>
pkgname=carafe
pkgver=0.1.2
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
sha256sums=('0f163f33f3b9eb510a8b5860aba82c2b88ef0cdf866b226449bd42bd1e5ba3be')
build() {
  cmake -S "$srcdir/${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
