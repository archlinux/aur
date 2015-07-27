# Maintainer: ebiadsu <ebiadsu@posteo.de>
_pkgname=haskell-flycheck
pkgname=${_pkgname}-git
pkgver=r7.a2e29ed
pkgrel=1
pkgdesc="Haskell syntax checking by Flycheck in GNU Emacs."
arch=('any')
url="https://github.com/chrisdone/haskell-flycheck"
license=('GPL')
depends=('emacs' 'emacs-haskell-mode' 'flycheck')
makedepends=('emacs' 'emacs-haskell-mode' 'flycheck' 'git')
source=('git+https://github.com/chrisdone/haskell-flycheck.git')
noextract=()
sha512sums=('SKIP') 


pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  emacs --batch -f batch-byte-compile haskell-flycheck.el
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  install -d "$pkgdir/usr/share/emacs/site-lisp/haskell-flycheck"
  install -Dm644 haskell-flycheck.{el,elc} "$pkgdir/usr/share/emacs/site-lisp/haskell-flycheck"
}
