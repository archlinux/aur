# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=linum-relative
_pkgmaintainer=coldnew
_pkgdestdirname=linum-relative
_versionprefix=
pkgver=0.5
pkgrel=1
pkgdesc="Display relative line number in the left margin in emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL2')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('5b4fac5fd35f19c0cfc65f474fba4b7fe62279a24a0e9b03a7c6a023f2ce8e68')
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
