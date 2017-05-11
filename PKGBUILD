# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=popwin-el
_pkgmaintainer=m2ym
_pkgdestdirname=popwin
_versionprefix=v
pkgver=1.0.0
pkgrel=1
pkgdesc="Popup Window Manager for Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('4f09c3cf6294dd6cb57751f9911c59d9367b25c8748689e7748c464f1abd46aa')
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
