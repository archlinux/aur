# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.20
_pkgbase=mate-menus
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.2
pkgrel=1
pkgdesc="MATE menu specifications (GTK2 version)"
url="https://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('glib2')
makedepends=('gobject-introspection' 'intltool' 'python2')
optdepends=('python2: python2 bindings')
groups=('mate-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("https://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('569e5ed9fa8caddfd73dc368b81994584d1458ef')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-python

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
