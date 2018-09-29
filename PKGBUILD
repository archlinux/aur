# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=mate-system-monitor
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.1
pkgrel=5
pkgdesc="A system monitor for MATE (GTK3 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dconf' 'dbus-glib' 'glibmm' 'gtkmm3' 'libgtop' 'libwnck3' 'librsvg')
makedepends=('docbook2x' 'mate-common>=1.21' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('d92a6a28e5499c5cc0ddd0f95b0caf59ffc2e2c0')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --localstatedir=/var \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
