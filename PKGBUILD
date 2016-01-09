# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Gimmeapill <gimmeapill at gmail dot com>
_pkgbasename=sequencer64
pkgname=${_pkgbasename}-git
pkgver=r233.c14ba05
pkgrel=2
pkgdesc="A live-looping MIDI sequencer"
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/sequencer64.git"
license=('GPL')
depends=('gtkmm' 'jack')
makedepends=('git' 'doxygen' 'texlive-bin')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://github.com/ahlstromcj/sequencer64.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgbasename}"

    ./bootstrap
    ./configure --prefix=/usr --disable-lash
    make
}

package() {
    cd "${srcdir}/${_pkgbasename}"

    make DESTDIR="${pkgdir}" install

    install -v -D -m 0644 "debian/${_pkgbasename%64}24.xpm" "${pkgdir}/usr/share/pixmaps/${_pkgbasename}.xpm"
    install -v -D -m 0644 "debian/${_pkgbasename}.desktop" "${pkgdir}/usr/share/applications/${_pkgbasename}.desktop"
}

