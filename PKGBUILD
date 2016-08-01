# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=mate-session-manager
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="The MATE Session Handler (GTK3 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL' 'LGPL')
depends=('dbus-glib' 'glib2' 'gtk3' 'gtk-update-icon-cache' 'libsm' 'libxtst'
         'mate-desktop-1.15-gtk3' 'mate-polkit-1.15-gtk3' 'mate-settings-daemon-1.15-gtk3'
         'ttf-dejavu' 'xdg-user-dirs')
makedepends=('mate-common' 'xmlto' 'xtrans' 'gtk3' 'mate-desktop-1.15-gtk3' 'mate-polkit-1.15-gtk3' 'mate-settings-daemon-1.15-gtk3')
optdepends=('lightdm-gtk-greeter: A lightweight display manager'
            'onboard: On-screen keyboard useful for mobility impaired users'
            'orca: Screen reader for blind or visually impaired individuals'
            'xdg-user-dirs-gtk: Add autostart that prompts to rename user directories when switching locales')
groups=('mate')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('f8e7383072511117a7f1fe4ca56afe7a5c3c9e35')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-gtk=3.0 \
        --disable-upower
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
