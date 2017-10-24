# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=metaio
_pkgname=${pkgname}
pkgver=8.4.0
pkgrel=5
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
sha256sums=('8990d5aa23614328880d15af72071009a578cedf75174e437b3d63643b850b76')
prepare() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    sed -i 's/\-Werror//g' configure
}
build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    ./configure --prefix=$pkgdir/usr CFLAGS=-O3
    make -j
}
check() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    make -j check
}
package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    make install
}
