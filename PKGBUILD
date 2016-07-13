# Maintainer:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=libmatekbd
pkgname="${_pkgbase}-1.15-gtk3"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="MATE keyboard library"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}-gtk3")
license=('LGPL')
depends=('dconf' 'gtk3' 'iso-codes' 'libxklavier')
makedepends=('mate-common>=1.15')
source=("http://pub.mate-desktop.org/releases/${_ver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('79886718fdca006066897b78beb4d77c939817d3')

prepare() {
    cd "${srcdir}"
    mv "${pkgname}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --with-gtk=3.0 \
        --disable-static
    make
}

package_libmatekbd() {
    pkgdesc+=' (GTK3 version [EXPERIMENTAL])'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
