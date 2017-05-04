# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=emacs-anzu
_pkgmaintainer=syohex
_pkgdestdirname=anzu
_versionprefix=
pkgver=0.62
pkgrel=1
pkgdesc="Emacs Port of anzu.vim"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('9f91077d12bffc2d30640dfc5a5b627139d03c06bee9335f5df6977e121a8f99')
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
