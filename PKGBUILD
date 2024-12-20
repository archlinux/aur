# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname=async++
pkgver=1.2
pkgrel=1
pkgdesc="Async++ is a lightweight concurrency framework for C++11."
arch=('any')
url='https://github.com/Amanieu/asyncplusplus'
license=('MIT')
depends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
makedepends=('cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0711c8db231bf3eb1066400f49ed73b5c3211a10eb3b8c3e64da3d5fdee8a4bf')

prepare() {
    mv "asyncplusplus-${pkgver}" "${pkgname}"
}

build() {
    cmake \
        -B "${pkgname}/build" \
        -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev

    cmake --build "${pkgname}/build/"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${pkgname}/build/"

    install -D -m644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -D -m644 "${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
