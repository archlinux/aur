# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=mate-icon-theme
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="MATE icon theme"
url="http://mate-desktop.org"
arch=('any')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('gtk-update-icon-cache')
makedepends=('icon-naming-utils' 'mate-common-1.15-gtk3')
options=(!strip !emptydirs)
groups=('mate')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('c83b1b4e53faf4a6991406e059192c4dc439d851')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/icons/mate/icon-theme.cache"
}
