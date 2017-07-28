# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-user-share
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.0
pkgrel=2
pkgdesc="User level public file sharing via WebDAV for MATE (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'libunique' 'mod_dnssd')
makedepends=('caja-gtk2' 'dbus-glib' 'intltool' 'itstool' 'libcanberra' 'libnotify')
optdepends=('caja: File sharing extension')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('7b241f0d969005653a164223b4d458beb9256910')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --libexec=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --with-gtk=2.0 \
        --disable-bluetooth

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make  DESTDIR="${pkgdir}" install
}
