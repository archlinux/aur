# Maintainer: milk <milk on freenode>
# modified from the original sequencer64-git pkg
# Contributor: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Gimmeapill <gimmeapill at gmail dot com>
_pkgbasename=sequencer64
pkgname=${_pkgbasename}-next-git
pkgver=0.96.0.r2.gb5809dd8
pkgrel=1
pkgdesc="A live-looping MIDI sequencer. Development branch (unstable)"
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/sequencer64.git"
license=('GPL')
depends=('qt5-base' 'jack' 'sqlite')
makedepends=('git' 'autoconf-archive')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://github.com/ahlstromcj/sequencer64.git#branch=playlist")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbasename}"

    ./bootstrap --full-clean
    ./bootstrap -qt
    ./configure --enable-qt --enable-mainwid --enable-debug=yes --prefix=/usr 
    make
}

package() {
    cd "${srcdir}/${_pkgbasename}"

    make DESTDIR="${pkgdir}" install

    install -v -D -m 0644 "debian/${_pkgbasename}.xpm" "${pkgdir}/usr/share/pixmaps/${_pkgbasename}.xpm"
    install -v -D -m 0644 "debian/${_pkgbasename}.desktop" "${pkgdir}/usr/share/applications/${_pkgbasename}.desktop"
}
