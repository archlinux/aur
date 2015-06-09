# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=cryptol-git
_pkgname=cryptol

pkgver=v2.2.1.r0.g300ed3c
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
makedepends=('git' 'ghc' 'cabal-install>=1.20.0.0')
optdepends=('boolector: theorem proving'
            'mathsat-5: theorem proving'
            'yices-bin: theorem proving')
makedepends=()
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
}

package() {
  cd $srcdir/$_pkgname 
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/cryptol"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname/"
  #cp .cabal-sandbox/bin/cryptol "$pkgdir/usr/bin"
  cp dist/build/cryptol/cryptol "$pkgdir/usr/bin"
  cp lib/* "$pkgdir/usr/share/cryptol"
  cp LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
}
