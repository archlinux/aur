#Maintainer: Marco Claessens <marco@twilp.nl>

pkgname=bosce
pkgver=1.3
pkgrel=2
pkgdesc="boost::statechart extractor"
makedepends=('gcc' 'make' 'cmake')
depends=('boost')
optdepends=('plantuml: Generate PNG files')
arch=('x86_64' 'aarch64')
url="https://github.com/kanje/bosce"
license=("Boost")

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)

sha256sums=('5da52265b155324db79103306ce91d553f3e983cd4db5f1a103782e1f3076334')

build() {
  rm -rf build
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

check() {
    cd build
    ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

