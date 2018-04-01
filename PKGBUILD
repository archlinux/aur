# Maintainer: E5ten

pkgname=yad-webkitgtk
_pkgname=yad
pkgver=0.40.0
pkgrel=4
pkgdesc="A fork of zenity - display graphical dialogs from shell scripts or command line, 
using webkitgtk instead of webkit2gtk because yad only supports webkitgtk-3.0 while 
webkit2gtk uses webkitgtk-4.0"
url="http://sourceforge.net/projects/yad-dialog"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gtk3' 'webkitgtk')
makedepends=('autoconf' 'automake' 'intltool')
source=("${url}/files/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('c2d0b7d1b6d3a0877299faa00db75d58c974f81fce72d520a3a84e67d1d60ef4')
provides=('yad=0.40.0')
conflicts=('yad')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    autoreconf -ivf
    intltoolize
    ./configure --prefix=/usr --with-gtk=gtk3 --enable-icon-browser --enable-html
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

