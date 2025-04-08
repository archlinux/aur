# Maintainer:
# Contributor: The-EDev <farook@the-e-dev.com>

pkgname=crow
pkgver=1.2.1.2
pkgrel=1
pkgdesc="A Fast and Easy to use C++ microframework for the web"
arch=(any)
url="https://crowcpp.org"
license=('BSD-3-Clause')
makedepends=('asio' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CrowCpp/Crow/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dc008515f64c9054250909a16bf0d9173af845d2c6d4e49ed6d3f0f32dfdc747')

build() {
    cmake -B build -S "${pkgname^}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCROW_BUILD_EXAMPLES=OFF \
        -DCROW_BUILD_TESTS=OFF \
        -DCROW_ENABLE_COMPRESSION=ON \
        -DCROW_ENABLE_SSL=ON \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname^}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
