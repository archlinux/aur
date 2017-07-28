# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.14
_pkgbase=mate-notification-daemon
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=2
provides=('notification-daemon')
pkgdesc="Notification daemon for MATE (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'dbus-glib' 'libcanberra' 'libwnck' 'libnotify')
makedepends=('intltool')
groups=('mate-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('10e863c16112b45935d6d5e6e003088df43f87ab')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=2.0

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
