# Maintainer:  Esben Haabendal <esben@haabendal.dk>

pkgname=emacs-ghub
_github_org="magit"
_github_repo="ghub"
pkgver=2.0.1
pkgrel=1
pkgdesc="Emacs - Minuscule client library for the Github API"
arch=('any')
url="http://github.com/${_github_org}/${_github_repo}"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-ghub')
source=("git+https://github.com/${_github_org}/${_github_repo}.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_github_repo}"
  emacs -batch -Q -L . -f batch-byte-compile ghub.el
}

package() {
  cd "$srcdir/${_github_repo}"
  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 ghub.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
}
