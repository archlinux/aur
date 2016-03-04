# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Gimmeapill <gimmeapill at gmail dot com>
_pkgbasename=sequencer64
pkgname=${_pkgbasename}-git
pkgver=0.9.9.18.r4.g6dd88af
pkgrel=1
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

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

    install -v -D -m 0644 "debian/${_pkgbasename}.xpm" "${pkgdir}/usr/share/pixmaps/${_pkgbasename}.xpm"
    install -v -D -m 0644 "debian/${_pkgbasename}.desktop" "${pkgdir}/usr/share/applications/${_pkgbasename}.desktop"
}

