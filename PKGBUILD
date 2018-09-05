# Maintainer: sballert <sballert@posteo.de>

_gituser="Somelauw"
_gitrepo="evil-org-mode"

pkgname=emacs-evil-org-git
pkgver=r168.b6d652a
pkgrel=1
pkgdesc="Supplemental evil-mode keybindings to emacs org-mode"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil')
makedepends=('git')
provides=('emacs-evil-org')
conflicts=('emacs-evil-org')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
  rm evil-org-test.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
}
