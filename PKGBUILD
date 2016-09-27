# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-session-manager
pkgname=(${_pkgbase}-upower)
pkgver=${_ver}.0
pkgrel=1
pkgdesc="The MATE Session Handler with upower (i.e. no-systemd) support"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus-glib' 'gtk3' 'libsm')
makedepends=('intltool')
optdepends=('gnome-keyring: keyring support'
            'xdg-user-dirs-gtk: manage user directories')
groups=('mate' 'mate-gtk3')

conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=(${_pkgbase}=$pkgver)
replaces=('mate-session-manager-gtk3')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('553b28bbbd9164e0403783db58015fa42d3ae38d')

build() {
    cd ${_pkgbase}-${pkgver}
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-upower
    make
}

package() {
    cd ${_pkgbase}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
