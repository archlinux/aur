# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=avy
_pkgdestdirname=avy
_pkgmaintainer=abo-abo
_versionprefix=
pkgver=0.4.0
pkgrel=1
pkgdesc="Jump to things in Emacs tree-style"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('269d1a0710f86c3fd82a7099f5b9f359b45d7dd36b0ab7e4afbe082842c1b9f1')
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
