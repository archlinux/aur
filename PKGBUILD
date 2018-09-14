# Maintainer: sballert <sballert@posteo.de>

_gituser="vermiculus"
_gitrepo="graphql.el"

pkgname=emacs-graphql-git
pkgver=r53.b64ab8d
pkgrel=1
pkgdesc="GraphQL utilities"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-graphql')
conflicts=('emacs-graphql')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/graphql/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/graphql/
}
