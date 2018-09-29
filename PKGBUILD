# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=mate-notification-daemon
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.1
pkgrel=5
provides=('notification-daemon' "${_pkgbase}" "${_pkgbase}-gtk3")
pkgdesc="Notification daemon for MATE (GTK3 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL' 'LGPL')
depends=('dconf' 'dbus-glib' 'glib2' 'gtk3' 'gtk-update-icon-cache'
         'libcanberra' 'libwnck3' 'libwnck3' 'libnotify')
makedepends=('mate-common>=1.21')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('dc61258f5ebf0de1f2275a2a0bd3c06323242958')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=3.0 \
        --disable-static
    make
}

package() {
    groups=('mate')
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
