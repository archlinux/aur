# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-panel
pkgname=${_pkgbase}-gtk2
pkgver=${_ver}.2
pkgrel=2
pkgdesc="The MATE Panel (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus-glib' 'libwnck' 'libcanberra' 'libmateweather-gtk2' 'libsm' 'mate-menus-gtk2' 'mate-desktop-gtk2')
makedepends=('intltool' 'itstool' 'gobject-introspection')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
sha1sums=('b6029edf7c54a751effd498871119f302625c91f')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-gtk=2.0 \
        --enable-introspection

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
