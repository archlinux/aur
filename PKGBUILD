# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=elpy
_pkgmaintainer=jorgenschaefer
_pkgdestdirname=elpy
_versionprefix=
pkgver=1.15.1
pkgrel=2
pkgdesc="Emacs Python Development Environment"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-company-mode' 'emacs-find-file-in-project' 'emacs-highlight-indentation' 'emacs-pyvenv' 'emacs-yasnippet' 'emacs-s' 'python-elpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('562b04790c1fa70bf9370330fee84f727f402e2658d7184cb068ffb10e41ddfd')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/snippets/python-mode"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 snippets/python-mode/* "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/snippets/python-mode"
}
