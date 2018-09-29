# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=mate-icon-theme-faenza
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.0
pkgrel=5
pkgdesc="Faenza icon theme for MATE"
url="http://mate-desktop.org"
arch=('any')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('LGPL')
depends=('gtk-update-icon-cache')
makedepends=('git' 'icon-naming-utils' 'mate-common>=1.21')
options=(!strip)
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('209eadbf3425a4203a01a59ca284d0b954b81942')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/icons/matefaenza/icon-theme.cache"
}
