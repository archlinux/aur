# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
_pkgbase=mozo
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=5
pkgdesc="MATE menu editing tool (GTK3 version)"
url="http://mate-desktop.org"
arch=('any')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('gtk-update-icon-cache' 'mate-menus-dev' 'python2-gobject')
makedepends=('mate-common-dev')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('7c7c2aff98fa08bc19682b4b1f131f6108355a83')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
