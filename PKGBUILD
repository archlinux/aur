# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=libmateweather
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.1
pkgrel=1
pkgdesc="Provides access to weather information from the Internet (GTK3 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('LGPL')
depends=('dconf' 'gtk3' 'libsoup' 'glib2' 'gtk-update-icon-cache')
groups=('mate-extra')
makedepends=('mate-common-1.15-gtk3')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('ad4357c0a2e2d5c61b601b4b8fddbd409b82186f')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-gtk=3.0 \
        --disable-static \
        --disable-python \
        --enable-locations-compression
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
