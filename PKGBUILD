# Maintainer: sballert <sballert@posteo.de>

_gituser="d12frosted"
_gitrepo="flyspell-correct"

pkgname=emacs-flyspell-correct-git
pkgver=r70.0486912
pkgrel=1
pkgdesc="Correcting words with flyspell via custom interface."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-flyspell-correct')
conflicts=('emacs-flyspell-correct')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  rm flyspell-correct-{helm,ivy,popup}.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
