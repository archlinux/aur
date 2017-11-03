# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=libframe
_pkgname=${pkgname}
pkgver=8.30
pkgrel=6
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. ${_pkgname}"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('374743ccce835427a0900590a515c112661760e12ec596159d3f86073dd099da')
prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=${pkgdir}/usr CFLAGS='-O3 -Wno-error'
    make -j
}
check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make -j check
}
package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install
}
