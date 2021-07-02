# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=spinner.el
_pkgmaintainer=Malabarba
_pkgdestdirname=spinner
_versionprefix=
pkgver=1.7.4
pkgrel=1
pkgdesc="Emacs mode-line spinner for operations in progress"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('69c1c18f350ccb8bb50b9dab27df7b8bbfed4b1447a171ae24c868eea717793c')

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
