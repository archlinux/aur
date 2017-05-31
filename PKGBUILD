# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=py-autopep8.el
_pkgmaintainer=paetzke
_pkgdestdirname=py-autopep8
_versionprefix=v
pkgver=2016.1
pkgrel=2
pkgdesc="py-autopep8.el integrates autopep8 into Emacs."
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'autopep8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('36b17f3fa9998bdba38cf75506d628f433ac9baf52c93c78d7f54cdc3a2ba398')
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
