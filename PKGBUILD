# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: DuckSoft <realducksoft at gmail>
pkgname=proverif
pkgver=2.04
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the formal model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/proverif/'
license=('GPL')
depends=('ocaml')
makedepends=('ocamlbuild' 'ocaml-findlib' 'lablgtk2')
optdepends=('graphviz: for displaying graphs of found attacks')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif$pkgver.tar.gz")
sha1sums=('37481ce4b86cd00545ce50b60ce723139dadc6f3')
sha256sums=('a96e5ec13f35c9ead7a0e960df69bc4018eb6a46939da501613d9d93cab5fc75')

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
