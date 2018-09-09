# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-paredit-git
pkgver=r216.acbe10f
_pkgname=paredit
pkgrel=1
pkgdesc="Emacs minor mode for pseudo-structurally editing Lisp code"
arch=('any')
url="http://www.emacswiki.org/emacs/ParEdit"
license=('GPL')
conflicts=('paredit')
provides=('paredit')
makedepends=('emacs' 'git')
install=paredit.install
source=("git+http://mumble.net/~campbell/git/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd paredit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd paredit
  emacs -Q -batch -f batch-byte-compile paredit.el
}

check() {
  cd paredit
  . ./check.sh
}

package() {
  cd paredit
  install -D -m644 paredit.elc \
	  "$pkgdir"/usr/share/emacs/site-lisp/paredit.elc
  install -D -m644 paredit.el \
	  "$pkgdir"/usr/share/emacs/site-lisp/paredit.el
}

