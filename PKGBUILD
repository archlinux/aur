# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cvc4-git
_pkgname=CVC4

pkgver=1.6.r709.g219bc5991
pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="An automatic theorem prover for SMT problems."
url="http://cvc4.cs.stanford.edu"
arch=('x86_64' 'i686')
license=('BSD')
depends=('gmp' 'java-runtime' 'python2')
makedepends=('git' 'gcc' 'make' 'bash' 'cmake')
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
    ./contrib/get-antlr-3.4
    ./configure.sh --prefix=/usr
    cd build
    make
    make check
}

package() {
    cd $srcdir/CVC4/build
    make DESTDIR="$pkgdir/" install
}
