# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalapps
_pkgname=${pkgname}
pkgver=6.21.0
pkgrel=7
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. ${_pkgname}"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('lalcore' 'lalframe' 'lalmetaio' 'lalxml' 'lalsimulation' 'lalburst' 'lalinspiral' 'lalpulsar' 'lalinference' 'lalstochastic')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('2b997406b7bca358295e6d060919346fd5281ec0217a357c91849012bc2c9973')
prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=${pkgdir}/usr CFLAGS=-O3
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
