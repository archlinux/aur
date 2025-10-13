# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Alastair Hughes < hobbitalastair at yandex dot com>
# Contributor: m040601

pkgname='ical2html'
pkgver='3.0'
pkgrel=3
pkgdesc="Utilities to filter, merge, and generate HTML from ical files"

arch=('i686' 'x86_64' 'aarch64')
url="https://www.w3.org/Tools/Ical2html"
license=('custom')
depends=('libical')
source=("https://www.w3.org/Tools/Ical2html/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d50844d38726a2184f819dc8f23cf6f19ed99d22641f668f9d1b1ee7fa517840')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix="/usr"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    mkdir -p ${pkgdir}/usr/share/${pkgname}/
    mv ${pkgdir}/usr/share/calendar.css \
    ${pkgdir}/usr/share/${pkgname}/calendar.css
    install -Dm0644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
