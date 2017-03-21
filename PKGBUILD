# Maintainer: Christos Nouskas <nous@archlinux.us>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.18
_pkgbase=mate-session-manager
pkgname=(${_pkgbase}-upower)
pkgver=${_ver}.0
pkgrel=1
pkgdesc="The MATE Session Handler (GTK2 version) with upower (i.e. no-systemd) support"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mate-desktop' 'mate-polkit' 'mate-settings-daemon' 'upower-pm-utils=0.9.23' 'libsm'
         'libxtst' 'xtrans')
makedepends=('intltool')
optdepends=('mdm-nosystemd: the MDM Display Manager with consolekit support for non-systemd setups'
            'xdg-user-dirs-gtk: manage user directories')
groups=('mate')
provides=(${_pkgbase}=$pkgver)
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha256sums=('1c50f7866d8c75c1a918754960c6629798d6cb0f8d06aa3e48516ea672c7d419')

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
