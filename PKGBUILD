# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=mate-session-manager-upower
_pkgname=mate-session-manager
pkgver=1.8.1
pkgrel=4
pkgdesc="The MATE Session Handler with upower (i.e. no-systemd) support"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('dbus-glib' 'gtk2' 'libsm' 'libxtst' 'mate-desktop' 'mate-polkit'
         'mate-settings-daemon' 'ttf-dejavu' 'xdg-user-dirs' 'upower-pm-utils')
makedepends=('mate-common' 'pangox-compat' 'perl-xml-parser' 'xmlto')
optdepends=('lightdm-gtk2-greeter: A lightweight display manager'
            'onboard: On-screen keyboard useful for mobility impaired users'
            'orca: Screen reader for blind or visually impaired individuals'
            'xdg-user-dirs-gtk: Add autostart that prompts to rename user directories when switching locales'
            'yelp: for reading MATE help documents')
conflicts=(${_pkgname})
provides=(${_pkgname})
groups=('mate')
source=("http://pub.mate-desktop.org/releases/1.8/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('af07f12aaad1c6fd7626dfcf95c01c519bde3819')
install=${pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-gtk=2.0 \
        --enable-upower
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
