# Maintainer: redtide <redtid3@gmail.com>

pkgname="elflibviewer"
pkgname_="mpyne-elflibviewer-73f04bda4d61"
pkgver=0.20
pkgrel=3
pkgdesc="Lists recursive library dependencies for an ELF executable"
url="https://bitbucket.org/mpyne/${pkgname}"
arch=('x86_64')
license=('GPL2')
makedepends=('cmake' 'qt5-tools')
depends=('qt5-base')
source=("${url}/get/${pkgver}.tar.gz")
sha512sums=('212639ddce085dcc51f6b92fa7f08e973cad2e973334660ad193afe67aea66c1679679cfa7f90309ecfccc639f176e4289e45f1addd681bfccff065774fc72aa')
build() {
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" "${srcdir}/${pkgname_}"
    cmake --build . --target all
}
package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install

    cd "${srcdir}/${pkgname_}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
