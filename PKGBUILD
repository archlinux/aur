# Maintainer: sballert <sballert@posteo.de>

_gituser="vspinu"
_gitrepo="imenu-anywhere"

pkgname=emacs-imenu-anywhere-git
pkgver=r76.fc7f0fd
pkgrel=1
pkgdesc="ido/ivy/helm imenu tag selection across buffers with the same mode/project etc"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-imenu-anywhere')
conflicts=('emacs-imenu-anywhere')
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
