# Maintainer: Fred Mitchell <fred.mitchell@atomlogik.de>
pkgname=swiss-army-knife-hs
pkgver=0.1.0.4
pkgrel=4
pkgdesc="A collection of powerful but useful small tools."
arch=('x86_64')
url="https://github.com/flajann2/swiss-army-knife-hs"
license=('MIT')
depends=('ghc' 'cabal-install')
makedepends=('git' 'ghc-libs' 'cabal-install')
source=("$pkgname::git+https://github.com/flajann2/swiss-army-knife-hs.git")
md5sums=('SKIP')

build() {
   cd "$srcdir/$pkgname"
   cabal configure
   cabal build 
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    cabal install --overwrite-policy=always
    install -Dm755 $(find . -path "*/sak/build/sak/*" -name sak -type f) "$pkgdir/usr/bin/sak"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
