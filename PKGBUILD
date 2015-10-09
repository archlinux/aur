# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=cryptoverif
pkgver=1.21
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the computational model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/'
license=('custom:CeCILL-B')
depends=('ocaml')
optdepends=('ocaml-cryptokit: compiling extracted implementations')
source=('http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/cryptoverif1.20.tar.gz')
sha1sums=('067bba576f823b76a3ab2ca1b295fee08b4311a1')
sha256sums=('72f705acce85034a81da05ba90d51cff55254e273443359ab221f359eef8c603')

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
