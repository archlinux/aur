# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.12
_pkgbase=mate-session-manager
pkgname=(${_pkgbase}-upower)
pkgver=${_ver}.1
pkgrel=1
pkgdesc="The MATE Session Handler (GTK2 version) with upower (i.e. no-systemd) support"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('dbus-glib' 'gtk2' 'libsm' 'libxtst' 'mate-desktop>=1.12'
         'mate-polkit>=1.12' 'mate-settings-daemon>=1.12' 'ttf-dejavu'
         'xdg-user-dirs')
makedepends=('mate-common' 'pangox-compat' 'xmlto')
optdepends=('mdm-nosystemd: The MDM Display Manager with consolekit support for non-systemd setups'
            'onboard: On-screen keyboard useful for mobility impaired users'
            'orca: Screen reader for blind or visually impaired individuals'
            'xdg-user-dirs-gtk: Add autostart that prompts to rename user directories when switching locales')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=(${_pkgbase}=$pkgver)
groups=('mate')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha256sums=('2bad592d7dc0e6807f347bba1580c7c9f5d880aeedee2293d4c8947ab439e7e2')
install=${_pkgbase}.install

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-gtk=2.0 \
        --enable-upower
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

##
