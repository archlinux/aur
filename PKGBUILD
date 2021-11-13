# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=cryptoverif
pkgver=2.05
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the computational model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/'
license=('custom:CeCILL-B')
depends=('ocaml')
optdepends=('ocaml-cryptokit: compiling extracted implementations')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/cryptoverif$pkgver.tar.gz")
sha256sums=('179795379013628f48be98b679887dea4b6e4d651ea2a816311e01a87bbc105b')

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
