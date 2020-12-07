# Maintainer: Gabriel Guldner <gabriel at guldner . eu>

pkgname=polygone
pkgver=4
pkgrel=1
pkgdesc="Is a utility that can significantly reduce the size of certain postscript graphics files."
arch=('x86_64')
url="http://pcwww.liv.ac.uk/~itho17/personal/polygone/index.htm"
license=('custom')
depends=('gcc-libs')
makedepends=('gcc-fortran')
provides=(${pkgname})
conflicts=(${pkgname})
source=("http://pcwww.liv.ac.uk/~itho17/personal/polygone/src/polygone${pkgver}.f90")
sha256sums=(564b60363ea40cac0f3dd7a693d722617fac8d271e8ff533df052c4f0d8a71ed)

build() {
    cd "$srcdir"
    gfortran -O2 -Wl,-z,relro,-z,now -o polygone "polygone${pkgver}.f90"
    
    cat "polygone${pkgver}.f90" | head -36 > LICENSE
}

package() {
    cd "$srcdir"

	mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/licenses/polygone"

    install -m755 polygone "$pkgdir/usr/bin"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/polygone"
}
