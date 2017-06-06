# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=buffer-move
_pkgmaintainer=lukhas
_pkgdestdirname=buffer-move
_versionprefix=
pkgver=0.6.2
pkgrel=1
pkgdesc="Swap buffers between windows in Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('570d9871752ee79f18bbfe1b12d920cebbb9b6139c9386e93d3734062071ef45')
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
