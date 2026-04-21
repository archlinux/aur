# Maintainer:
# Contributor: The-EDev <farook@the-e-dev.com>

pkgname=crow
pkgver=1.3.2
pkgrel=1
pkgdesc="A Fast and Easy to use C++ microframework for the web"
arch=(any)
url="https://crowcpp.org"
license=('BSD-3-Clause')
makedepends=('asio' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CrowCpp/Crow/archive/v${pkgver}.tar.gz")
sha256sums=('82926bba66a48fa8dd0165cbc1f1b96b6dc9c3e56d08d318d901196e13eccf1a')

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
