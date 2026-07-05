# Maintainer:
# Contributor: The-EDev <farook@the-e-dev.com>

pkgname=crow
pkgver=1.3.3
pkgrel=1
pkgdesc="A Fast and Easy to use C++ microframework for the web"
arch=(any)
url="https://crowcpp.org"
license=('BSD-3-Clause')
makedepends=('asio' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CrowCpp/Crow/archive/v${pkgver}.tar.gz")
sha256sums=('b18621bd69f851f2df288fac715785ff8e4d0d468b99fc930cb2ff45a26c4ca6')

build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CROW_BUILD_EXAMPLES=OFF
        -D CROW_BUILD_TESTS=OFF
        -D CROW_ENABLE_COMPRESSION=ON
        -D CROW_ENABLE_SSL=ON
        -S "${pkgname^}-${pkgver}"
        -W no-dev
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    cd "${pkgname^}-${pkgver}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
