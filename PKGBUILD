# Maintainer: sballert <sballert@posteo.de>

_gituser="seagle0128"
_gitrepo="doom-modeline"

pkgname=emacs-doom-modeline-git
pkgver=r181.ac03729
pkgrel=1
pkgdesc="A fancy mode-line from DOOM Emacs."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-all-the-icons' 'emacs-dash' 'emacs-eldoc-eval'
'emacs-projectile' 'emacs-shrink-path')
makedepends=('git')
provides=('emacs-doom-modeline')
conflicts=('emacs-doom-modeline')
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
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
