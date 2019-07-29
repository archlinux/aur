# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=elpy
_pkgmaintainer=jorgenschaefer
_pkgdestdirname=elpy
_versionprefix=
pkgver=1.29.1.r41.g7acdd14
pkgrel=1
pkgdesc="Emacs Python Development Environment"
pkgname=emacs-${_pkgdestdirname}-git
arch=('any')
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-company-mode' 'emacs-find-file-in-project' 'emacs-highlight-indentation' 'emacs-pyvenv' 'emacs-yasnippet' 'emacs-s' 'python-elpy')
source=("$_pkgsrcname::git+$url")
sha256sums=('SKIP')
makedepends=('git')
conflicts=('emacs-elpy')
provides=('emacs-elpy')
install=emacs-${_pkgsrcname}.install

pkgver() {
  cd ${_pkgsrcname}
  git describe --tags|sed 's+-+.r+'|tr - .
}

build() {
  cd ${_pkgsrcname}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/snippets/python-mode
  install -m644 *.el "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 snippets/python-mode/* "$pkgdir"/usr/share/emacs/site-lisp/snippets/python-mode/
}
