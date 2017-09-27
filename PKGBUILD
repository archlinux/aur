# Contributor: Ivan Kuraj

_name=quickchick
pkgname=coq-${_name}-git
pkgver=r1085.02c3b09
pkgrel=1
pkgdesc="Property-based testing plugin for Coq"
arch=(i686 x86_64)
url="https://github.com/QuickChick/QuickChick"
license=('MIT')
depends=('coq' 'ssreflect')
makedepends=('ocaml')
source=(
  'repo::git+https://github.com/QuickChick/QuickChick.git'
  path.patch
)

pkgver() {
  cd "$srcdir/repo/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/repo"
  patch  < ../path.patch
  make -j
}

package() {
  cd "$srcdir/repo"
  make COQLIB="$pkgdir/`coqtop -where`/"  install
}

md5sums=('SKIP'
         '93d5139b6f1f058bedb54113bd5bf5db')
