# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.17
_pkgbase=mate-panel
pkgname="${_pkgbase}"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="The MATE Panel"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'dconf' 'glib2' 'gtk3' 'gtk-update-icon-cache' 'libwnck3'
         'libcanberra' 'libice' 'libmateweather>=1.17' 'librsvg' 'libsm' 'libsoup'
         'libxau' 'mate-menus>=1.17' 'mate-desktop>=1.17')
makedepends=('gobject-introspection' 'mate-common>=1.17' 'yelp-tools' 'gtk3'
             'libmateweather>=1.17' 'libwnck3' 'mate-desktop>=1.17')
optdepends=('yelp: for reading MATE help documents')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate')
sha1sums=('39918d8e736c266bce78a76470842621db3786da')

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
