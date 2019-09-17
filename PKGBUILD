# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
_pkgbase=mate-icon-theme
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.1
pkgrel=5
pkgdesc="MATE icon theme"
url="http://mate-desktop.org"
arch=('any')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('gtk-update-icon-cache')
makedepends=('icon-naming-utils')
options=(!strip !emptydirs)
groups=('mate')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('7bba62c0536d62911fb406b556409034d00f8fe7')

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
