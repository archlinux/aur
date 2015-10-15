# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=cryptoverif
pkgver=1.21
pkgrel=2
pkgdesc='Cryptographic protocol verifier in the computational model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/'
license=('custom:CeCILL-B')
depends=('ocaml')
optdepends=('ocaml-cryptokit: compiling extracted implementations')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/cryptoverif$pkgver.tar.gz")
sha1sums=('de0881ddd31d682395b06b21725bed73da8d7abb')
sha256sums=('c20077f0753af1a3e9c5d4231f3e7f6ae885451c2432eadc13faaf28351b8143')

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
  install -m644 docs/manual.{pdf,ps.gz} "$pkgdir/usr/share/cryptoverif/docs"
}
