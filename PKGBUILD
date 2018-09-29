# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=python-caja
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=5
pkgdesc="Python binding for Caja, to allow Caja property page and menu item extensions to be written in Python"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
groups=('mate')
license=('GPL')
depends=('caja>=1.21' 'python2-gobject')
makedepends=('mate-common>=1.21')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('2643dcd863a8b0e9399b7a63472656f18dcc5fe9')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    sed -i 's/python-config/python2-config/' configure
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
    cd "${srcdir}/${_pkgbase}-gtk3"
    sed -i 's/python-config/python2-config/' configure
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
