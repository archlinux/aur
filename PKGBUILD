# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: DuckSoft <realducksoft at gmail>
pkgname=proverif
pkgver=2.02pl1
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the formal model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/proverif/'
license=('GPL')
depends=('ocaml')
makedepends=('ocamlbuild' 'ocaml-findlib' 'lablgtk2')
optdepends=('graphviz: for displaying graphs of found attacks')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif$pkgver.tar.gz")
sha1sums=('d5421ac236a03a6c432417bf1b066d81cbc6b551')
sha256sums=('5d4aa21eb05b9fe11d1fe448259b7dbda7adca1cd15c09f0acee3508fa75bfca')

build() {
  cd "$srcdir/proverif$pkgver"
  ./build
}

check() {
  cd "$srcdir/proverif$pkgver"

  msg2 "Running typed tests..."
  ./test test typed

  msg2 "Running untyped tests..."
  ./test test untyped
}

package() {
  cd "$srcdir/proverif$pkgver"

  msg2 "Copying binaries..."
  install -Dm755 -vt "$pkgdir/usr/bin/" proverif{,totex,_interact}

  msg2 "Copying documentation..."
  install -Dm644 -vt "$pkgdir/usr/share/doc/proverif/" README CHANGES docs/*
  install -Dm644 -vt "$pkgdir/usr/share/licenses/proverif/" LICENSE

  msg2 "Copying examples..."
  mkdir -p "$pkgdir/usr/share/proverif/examples/"
  cp --preserve=m,t -Rvt "$pkgdir/usr/share/proverif/examples/" examples/*

  msg2 "Copying Emacs mode..."
  mkdir -p "$pkgdir/usr/share/emacs/site-lisp/"
  install -Dm644 -v emacs/proverif.el "$pkgdir/usr/share/emacs/site-lisp/proverif.el"
}
