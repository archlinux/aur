# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgbase="caja-extensions"
pkgname="caja-gksu"
pkgver="1.23.0"
pkgrel="1"
pkgdesc="Allows you to open files with administration privileges using the \
context menu when browsing your files with Caja."
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL')
groups=('mate-extra')
depends=('caja' 'caja-extensions-common' 'gksu')
makedepends=('intltool' 'python')
source=("https://pub.mate-desktop.org/releases/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.xz")
sha256sums=('e015238fe81f9f47d2e08543b89f0e47a645150f1639c485d978d4e0988fd3af')

build() {
    cd "${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${_pkgbase}-${pkgver}"
    make -C gksu DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
