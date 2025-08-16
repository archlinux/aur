# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=libmaddy
pkgver=1.6.0
pkgrel=1
pkgdesc="C++ Markdown to HTML header-only parser library"
arch=('any')
url="https://github.com/progsource/maddy"
license=('MIT')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('811b19efbc2fbf1957486ed78aabaf5d164d15f84464f7b4a7033b44591845c5')

build() {
    cmake -B build -S "${pkgname#lib}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname#lib}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
