# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=f.el
_pkgmaintainer=rejeep
_pkgdestdirname=f
_versionprefix=v
pkgver=0.19.0
pkgrel=1
pkgdesc="Modern API for working with files and directories in Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-s' 'emacs-dash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('3abf449393f5b26a68520a7ebaa7823995868dfaedd83e3d4646710f902d2914')
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
