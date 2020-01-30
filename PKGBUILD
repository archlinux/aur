# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
_pkgbase=mate-panel
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.2
pkgrel=5
pkgdesc="The MATE Panel"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'dconf' 'glib2' 'gtk3' 'gtk-update-icon-cache' 'libwnck3'
         'libcanberra' 'libice' 'libmateweather-dev' 'librsvg' 'libsm' 'libsoup'
         'libxau' 'mate-menus-dev' 'mate-desktop-dev')
makedepends=('gobject-introspection' 'mate-common-dev' 'yelp-tools' 'gtk3'
             'libmateweather-dev' 'libwnck3' 'mate-desktop-dev')
optdepends=('yelp: for reading MATE help documents')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate')
sha1sums=('0b6d3248d2a25c8c2313ef67b361117caf2fea13')

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
        --enable-introspection \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
