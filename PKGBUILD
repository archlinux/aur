# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cvc4-git
_pkgname=CVC4

pkgver=v1.4
pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="An automatic theorem prover for SMT problems."
url="http://cvc4.cs.nyu.edu/web/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('gmp' 'boost' 'libantlr3c')
makedepends=('git' 'gcc' 'make' 'bash')
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=('cvc4')
provides=('cvc4')
md5sums=('SKIP')

source=('git://github.com/CVC4/CVC4.git')

build() {
    cd $srcdir/CVC4
    ./autogen.sh
    ./contrib/get-antlr-3.4
    ./configure --with-antlr-dir=$srcdir/CVC4/antlr-3.4 ANTLR=$srcdir/CVC4/antlr-3.4/bin/antlr3 --prefix=/usr
    make
    make check
}

package() {
    cd $srcdir/CVC4
    make DESTDIR="$pkgdir/" install
}
