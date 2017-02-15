# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=cryptoverif
pkgver=1.25
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the computational model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/'
license=('custom:CeCILL-B')
depends=('ocaml')
optdepends=('ocaml-cryptokit: compiling extracted implementations')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/cryptoverif$pkgver.tar.gz")
sha1sums=('d6ee54883ef5bb833abe7c006ff8f6e9f8a7e2ae')
sha256sums=('eb8f8f94f44a97d89f02dd1d7b07783998a783337f32d26e3887c34721a975bc')

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
