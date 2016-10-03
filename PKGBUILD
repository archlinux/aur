# Maintainer : Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-power-manager
pkgname=(${_pkgbase}-upower)
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Power management tool for the MATE desktop (GTK2 version), with upower 0.9.23"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus-glib' 'libcanberra' 'libgnome-keyring' 'libnotify' 'libunique' 'upower=0.9.23')
makedepends=('intltool' 'itstool' 'mate-panel')
optdepends=('mate-panel: Set brightness and inhibit power management from the panel')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate-extra')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
provides=("${_pkgbase}")
sha256sums=('70449008afb448daf4c18f533d3999f76c642b492594b0eaa751dec749330a3e')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --enable-applets \
        --with-gtk=2.0 \
        --disable-strict
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
