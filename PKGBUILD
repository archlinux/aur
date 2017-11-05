# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cryptol-git
_pkgname=cryptol

pkgver=2.5.0.r254.g8c6af86
pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="A domain-specific language for specifying cryptographic algorithms."
url="http://www.cryptol.net"
arch=('x86_64' 'i686')
license=('BSD')
depends=('cvc4')
makedepends=('git' 'ghc' 'cabal-install>=1.20.0.0' 'alex' 'z3')
optdepends=('boolector: theorem proving'
            'mathsat-5: theorem proving'
            'yices-bin: theorem proving')
conflicts=()
replaces=()
backup=()
conflicts=('cryptol')
provides=('cryptol')
md5sums=('SKIP')

source=("git://github.com/GaloisInc/cryptol.git")

build() {
    cd $srcdir/${_pkgname}
    cabal update
    make
    cabal install
}

package() {
    cd $srcdir/$_pkgname 
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/cryptol
    mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
    cp .cabal-sandbox/bin/cryptol $pkgdir/usr/bin
    cp -r lib/* $pkgdir/usr/share/cryptol
    cp LICENSE $pkgdir/usr/share/licenses/$_pkgname/
}
