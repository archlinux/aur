# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=cryptoverif
pkgver=2.02
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the computational model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/'
license=('custom:CeCILL-B')
depends=('ocaml')
optdepends=('ocaml-cryptokit: compiling extracted implementations')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/cryptoverif$pkgver.tar.gz")
sha256sums=('17634d92b15ae73460c6dfa9ee33b7e034fabf06672a3b1dea1e2caaa4d6d396')

build() {
  cd "$srcdir/cryptoverif$pkgver"
  ./build
}

check() {
  cd "$srcdir/cryptoverif$pkgver"
  ./test
}

package() {
  cd "$srcdir/cryptoverif$pkgver"

  install -Dm755 cryptoverif "$pkgdir/usr/bin/cryptoverif"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cryptoverif/LICENSE"

  install -m755 -d "$pkgdir/usr/"{share/cryptoverif/docs,lib/cryptoverif/implementation}
  install -m644 default.{cvl,ocvl} "$pkgdir/usr/lib/cryptoverif/" 
  install -m644 implementation/{{base,crypto}.{ml,mli},crypto_dbg.ml,crypto_real.ml} "$pkgdir/usr/lib/cryptoverif/implementation"
}
