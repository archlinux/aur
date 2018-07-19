# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-use-package-git
pkgver=r801.3fb8f39
pkgrel=1
pkgdesc="A use-package declaration for simplifying your .emacs"
url="https://github.com/jwiegley/use-package"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-use-package')
conflicts=('emacs-use-package')
source=("git+https://github.com/jwiegley/use-package.git")
md5sums=('SKIP')
_gitname="use-package"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  rm use-package-tests.el
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd $_gitname
  install -d "${pkgdir}/usr/share/emacs/site-lisp/use-package"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/use-package/"
}
