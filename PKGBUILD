# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.14
_pkgbase=mate-session-manager
pkgname=(${_pkgbase}-upower)
pkgver=${_ver}.1
pkgrel=2
pkgdesc="The MATE Session Handler (GTK2 version) with upower (i.e. no-systemd) support"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mate-desktop' 'mate-polkit' 'mate-settings-daemon' 'upower-pm-utils=0.9.23'
	'libsm' 'libxtst')
makedepends=('intltool')
optdepends=('mdm-nosystemd: the MDM Display Manager with consolekit support for non-systemd setups'
            'xdg-user-dirs-gtk: manage user directories')
groups=('mate')
provides=(${_pkgbase}=$pkgver)
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha256sums=('26bb04472e19d637db6e9653235d5343dd7b6f2a128a4d2b19366a8bd01d4502')

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
