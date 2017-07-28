# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=marco
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=2
pkgdesc="A window manager for MATE (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'libcanberra' 'libgtop' 'mate-desktop-schemas-gtk2' 'startup-notification' 'zenity')
makedepends=('intltool' 'itstool')
groups=('mate-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('ba29f366dcf957d73c7b7eda9e987f37c6ccc94c')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-gtk=2.0 \
        --enable-startup-notification

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
