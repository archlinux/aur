# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=pyvenv
_pkgmaintainer=jorgenschaefer
_pkgdestdirname=pyvenv
_versionprefix=v
pkgver=1.20
pkgrel=1
pkgdesc="Python virtual environment interface for Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('5bc16a9ca08ff0a533db40a2395f7b9c1e69d6eb92cbc1dcc4ec42a2060b09d7')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
