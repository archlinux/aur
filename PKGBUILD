# Maintainer: Inkurey22 <inkurey22.tr@proton.me>
# Contributor: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=qlementine
pkgver=1.4.2
pkgrel=1
pkgdesc="Modern QStyle for desktop Qt6 applications"
arch=('x86_64')
url="https://github.com/oclero/qlementine"
license=('MIT')
makedepends=('cmake' 'qt6-base' 'qt6-svg')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed5196e6e04614db65f9a5f813eb35bf05076b7bce07892db33e85cf7b598616')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
