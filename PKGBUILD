# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-execline-mode-git
_gitproj="elebihan"
_gitrepo="execline-mode"
pkgver=0.2.0
pkgrel=1
pkgdesc="GNU/Emacs major mode for editing execline scripts"
arch=('any')
url="http://github.com/${_gitproj}/${_gitrepo}"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-execline-mode')
install="${pkgname}.install"
source=("git+https://github.com/${_gitproj}/${_gitrepo}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  # Latest annotated tag (release)
  git describe --abbrev=0 --tags | sed 's/^v//'
}

build() {
  cd "$_gitrepo"
  emacs -batch -Q -L . -f batch-byte-compile execline-mode.el
}

package() {
  cd "$_gitrepo"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/execline-mode
  cp *.el* ${pkgdir}/usr/share/emacs/site-lisp/execline-mode
}
