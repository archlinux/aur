# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.10
_pkgbase=mate-session-manager
pkgname=(${_pkgbase}-upower)
pkgver=${_ver}.1
pkgrel=1
pkgdesc="The MATE Session Handler (GTK2 version) with upower (i.e. no-systemd) support"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('dbus-glib' 'gtk2' 'libsm' 'libxtst' 'mate-desktop>=1.10'
         'mate-polkit>=1.10' 'mate-settings-daemon>=1.10' 'ttf-dejavu'
         'xdg-user-dirs')
makedepends=('mate-common' 'pangox-compat' 'xmlto')
optdepends=('mdm-nosystemd: The MDM Display Manager with consolekit support for non-systemd setups'
            'onboard: On-screen keyboard useful for mobility impaired users'
            'orca: Screen reader for blind or visually impaired individuals'
            'xdg-user-dirs-gtk: Add autostart that prompts to rename user directories when switching locales')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=(${_pkgbase})
groups=('mate')
source=("http://pub.mate-desktop.org/releases/1.10/${_pkgbase}-${pkgver}.tar.xz")
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
sha256sums=('8b46a5223e3bb6b12c418e8b2f6cf7b9eea397c6e0859fc65ea52999d3908dfe')
