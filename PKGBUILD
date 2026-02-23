# Maintainer:
# Contributor: The-EDev <farook@the-e-dev.com>

pkgname=crow
pkgver=1.3.1
pkgrel=1
pkgdesc="A Fast and Easy to use C++ microframework for the web"
arch=(any)
url="https://crowcpp.org"
license=('BSD-3-Clause')
makedepends=('asio' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CrowCpp/Crow/archive/v${pkgver}.tar.gz")
sha256sums=('1aa4d487d7a1dd092d997f612608750aa5f5c5b618b4fe561dd8d249696fba79')

build() {
    cmake -B build -S "${pkgname^}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
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

    cd "${pkgname^}-${pkgver}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
