# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=eom
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.1
pkgrel=5
pkgdesc="An image viewing and cataloging program for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'desktop-file-utils' 'glib2' 'gobject-introspection-runtime'
         'gtk3' 'gtk-update-icon-cache' 'exempi' 'lcms2' 'libexif' 'libjpeg-turbo'
         'librsvg' 'mate-desktop>=1.21' 'pygtk' 'python2-gobject2'
         'startup-notification' 'zlib' 'libpeas')
makedepends=('gobject-introspection' 'mate-common>=1.21' 'yelp-tools' 'gtk3' 'mate-desktop>=1.21')
optdepends=('yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('d58819482f184bc3029e0262ff76d7151a2e83fd')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --localstatedir=/var \
        --with-gtk=3.0 \
        --with-librsvg \
        --disable-python
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
