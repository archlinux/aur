# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=spinner.el
_pkgmaintainer=Malabarba
_pkgdestdirname=spinner
_versionprefix=
pkgver=1.7.3
pkgrel=1
pkgdesc="Emacs mode-line spinner for operations in progress"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('90613a146a5b4eacf3b7db63f35961c14b2a87b71165ffb26f800d80f1912662')

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
