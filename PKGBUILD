# Maintainer: directrix1

_basename=gnoMint-master
pkgname=gnomint-git
pkgver=`date -u +%Y%m%d%H%M`
pkgrel=1
pkgdesc="Certification Authority management made easy."
arch=("i686" "x86_64")
url="http://gnomint.sf.net"
license=("GPL3")
depends=("gconf" "gtk2" "sqlite")
optdepends=()
makedepends=("autoconf" "intltool")  
conflicts=("${pkgname}" "gnomint")
options=("!buildflags")
source=("${_basename}.tar.gz::https://github.com/davefx/gnoMint/archive/master.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_basename}"
    CFLAGS="-g -O2 " ./autogen.sh --prefix=/usr
}

build() {
    cd "${srcdir}/${_basename}"
    make
}

package() {
    cd "${srcdir}/${_basename}"
    make install DESTDIR="$pkgdir"
    cd "${pkgdir}"
    mv usr/etc .
}
