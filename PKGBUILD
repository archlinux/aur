# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cryptol-git
_pkgname=cryptol

pkgver=2.6.0.r31.g2e4adcc
pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="A domain-specific language for specifying cryptographic algorithms."
url="http://www.cryptol.net"
arch=('x86_64' 'i686')
license=('BSD')
depends=('z3')
makedepends=('git' 'cabal-install')
optdepends=('boolector: theorem proving'
            'mathsat-5: theorem proving'
            'yices: theorem proving')
conflicts=()
replaces=()
backup=()
conflicts=('cryptol')
provides=('cryptol')
md5sums=('SKIP')

source=("git://github.com/GaloisInc/cryptol.git")

build() {
    cd $srcdir/${_pkgname}
    cabal new-update
    make
}

package() {
    cd $srcdir/$_pkgname
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/cryptol
    mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
    cp dist/build/cryptol/cryptol $pkgdir/usr/bin
    cp LICENSE $pkgdir/usr/share/licenses/$_pkgname/
}
