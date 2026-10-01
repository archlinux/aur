# Maintainer:
# Contributor: The-EDev <farook@the-e-dev.com>

pkgname=crow
pkgver=1.3.4
pkgrel=1
pkgdesc="A fast and easy to use C++ microframework for the web"
arch=(any)
url="https://crowcpp.org"
license=('BSD-3-Clause')
makedepends=('asio' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CrowCpp/Crow/archive/v${pkgver}.tar.gz")
sha256sums=('6be759b3a648b41f0adc3a8408a53fd0243775217b4e32e8101d69e4aadf48cc')

build() {
    local cmake_options=(
        -B build
        -S "${pkgname^}-${pkgver}"
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CROW_BUILD_EXAMPLES=OFF
        -D CROW_BUILD_TESTS=OFF
        -D CROW_ENABLE_COMPRESSION=ON
        -D CROW_ENABLE_SSL=ON
        -W no-author
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    cd "${pkgname^}-${pkgver}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
