# Maintainer: Somebody <somebody[at]foo[dot]tld>
_pkgname=eff
pkgname=eff-git
pkgver=r473.5ad3b54
pkgrel=2
pkgdesc="A functional programming language based on algebraic effects and their handlers."
url="http://www.eff-lang.org/"
arch=('x86_64' 'i686')
license=('custom')
depends=('ocaml' 'ocaml-menhir')
optdepends=('rlwrap: to wrap (automatically called if installed)' 'ledit: alternative to rlwrap')
makedepends=('git' 'ocaml-findlib')
#makedepends=('git' 'ocaml-findlib')
conflicts=()
replaces=()
backup=()
#install='foo.install'
#options=('!strip')
source=("git+https://github.com/matijapretnar/eff.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix /usr --destdir "$pkgdir"
  make
  make test
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
