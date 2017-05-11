# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=p4.el
_pkgmaintainer=gareth-rees
_pkgdestdirname=p4
_versionprefix=
pkgver=12.0
pkgrel=1
pkgdesc="Emacs Perforce Integration"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.zip::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/master.zip")
sha256sums=('88e2f2a1c5a3d8936612a30563017be93a480ae7ecc5adf2f337eafd05063def')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-master"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-master"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
