# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=pyvenv
_pkgmaintainer=jorgenschaefer
_pkgdestdirname=pyvenv
_versionprefix=v
pkgver=1.10
pkgrel=1
pkgdesc="Python virtual environment interface for Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('915798ce764c0d3fd587ed501a26e5361f5a7dedcab85cddc7dfb2091704de5d')
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
