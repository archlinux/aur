# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.14
_pkgbase=mate-polkit
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.0
pkgrel=2
pkgdesc="PolicyKit integration for the MATE desktop (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gtk2' 'polkit')
makedepends=('accountsservice' 'gobject-introspection' 'intltool')
groups=('mate-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('da2b4cf7b905a24fa22dd14e8991a71814ad7777')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgbase} \
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
