# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=Highlight-Indentation-for-Emacs
_pkgmaintainer=antonj
_pkgdestdirname=highlight-indentation
_versionprefix=v
pkgver=0.7.0
pkgrel=1
pkgdesc="Minor modes to highlight indentation guides in emacs."
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL2')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('4f27c4030ecf0e51a6c3d14556c9e181a7105e150fa11d214a6f0629424def56')
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
