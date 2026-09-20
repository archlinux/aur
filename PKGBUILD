# Maintainer: marlonn <marlonn.dev@proton.me>
pkgname=carafe
pkgver=0.2.0
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
  'umu-launcher'
)

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SlowNicoFish/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('797f1a1b14c6df60e7adfdde09d8de66d4230e3a81edf3a74c5102ab3024ec0c')
build() {
  cmake -S "$srcdir/${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  ls
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
