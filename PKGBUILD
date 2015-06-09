# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=merlin
pkgver=2.2
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs (ocamlmerlin binary only)"
arch=('i686' 'x86_64')
depends=('ocaml' 'ocaml-biniou' 'ocaml-findlib' 'ocaml-yojson' 'python2')
makedepends=('make')
url="https://github.com/the-lambda-church/merlin"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/the-lambda-church/$pkgname/tar.gz/v$pkgver)
sha256sums=('18278c95f9e3c32855a15fc5e14ac349a34001b6d3ab8833bdacaa0a6806562d')
options=('!strip')
provides=('merlin' 'ocaml-merlin')
conflicts=('ocaml-merlin' 'vim-ocaml-merlin-git')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE_MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE_MIT.txt"

  msg 'Installing documentation...'
  for _doc in `find . -maxdepth 1 -type f -name "*.md" -printf '%f\n'` CHANGELOG; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done

  msg 'Installing...'
  install -Dm 755 ocamlmerlin "$pkgdir/usr/bin/ocamlmerlin"
}
