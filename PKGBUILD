# Maintainer: redtide <redtid3@gmail.com>

_pkgname=seq192
pkgname=${_pkgname}-git
pkgver=228.c74835d
pkgrel=1
pkgdesc="MIDI sequencer based on seq24 with less features and more swag"
arch=("x86_64")
url="https://github.com/jean-emmanuel/seq192"
license=("GPL3")
provides=("seq192")
conflicts=("seq192")
depends=("gtkmm3" "jack" "liblo")
makedepends=("git" "nlohmann-json")
source=("git://github.com/jean-emmanuel/seq192.git")
sha512sums=("SKIP")
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${_pkgname}"
    make
}
package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mkdir -p "${pkgdir}/usr/share/applications"
    make DESTDIR="${pkgdir}" install PREFIX=/usr
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
