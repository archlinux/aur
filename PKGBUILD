# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=marco
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.2
pkgrel=5
pkgdesc="A window manager for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('glib2' 'libcanberra' 'libgtop' 'libice' 'libsm' 'libxt'
         'mate-desktop>=1.21' 'startup-notification' 'zenity')
makedepends=('mate-common>=1.21' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
groups=('mate')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('d14909587eaae9c8f5abf54f5e6069cdc482b9f8')

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
        --enable-startup-notification \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
