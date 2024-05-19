# Maintainer: gilcu3
# Previous Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: DuckSoft <realducksoft at gmail>
pkgname=proverif
pkgver=2.05
pkgrel=1
pkgdesc='Cryptographic protocol verifier in the formal model'
arch=('i686' 'x86_64')
url='http://prosecco.gforge.inria.fr/personal/bblanche/proverif/'
license=('GPL')
depends=('ocaml')
makedepends=('ocamlbuild' 'ocaml-findlib')
optdepends=('graphviz: for displaying graphs of found attacks')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif$pkgver.tar.gz")
sha1sums=('bbcfcc49d0199e111292da3754b95ae7e7404db4')
sha256sums=('4871f53c32ab4a04669a060c4886ba5d9080496963fb980a9a62d2c429ceabc4')

build() {
  cd "$srcdir/proverif$pkgver"
  ./build -nointeract
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
  install -Dm755 -vt "$pkgdir/usr/bin/" proverif{,totex}

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
