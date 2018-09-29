# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=mate-panel
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.6
pkgrel=5
pkgdesc="The MATE Panel"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'dconf' 'glib2' 'gtk3' 'gtk-update-icon-cache' 'libwnck3'
         'libcanberra' 'libice' 'libmateweather>=1.21' 'librsvg' 'libsm' 'libsoup'
         'libxau' 'mate-menus>=1.21' 'mate-desktop>=1.21')
makedepends=('gobject-introspection' 'mate-common>=1.21' 'yelp-tools' 'gtk3'
             'libmateweather>=1.21' 'libwnck3' 'mate-desktop>=1.21')
optdepends=('yelp: for reading MATE help documents')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate')
sha1sums=('8d8f8f80adb6ae23f000c4bf1fe39be315faeacd')

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
