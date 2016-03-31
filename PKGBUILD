# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=merlin-git
_pkgname=merlin
pkgver=20160325
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs (ocamlmerlin binary only)"
arch=('i686' 'x86_64')
depends=('ocaml' 'ocaml-findlib' 'ocaml-yojson')
makedepends=('git')
url="https://github.com/the-lambda-church/merlin"
license=('MIT')
source=(git+https://github.com/the-lambda-church/merlin)
sha256sums=('SKIP')
options=('!strip')
provides=('merlin')
conflicts=('merlin' 'vim-ocaml-merlin-git')

pkgver() {
  cd ${_pkgname}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${_pkgname}

  ./configure --prefix "/usr"
  make ocamlmerlin
}

package() {
   cd ${_pkgname}

  install -Dm 644 LICENSE_MIT.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE_MIT.txt"

  make DESTDIR="$pkgdir" install-binary
}

