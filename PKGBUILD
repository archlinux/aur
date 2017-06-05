# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=evil-lispy
_pkgmaintainer=sp3ctum
_pkgdestdirname=evil-lispy
_versionprefix=
pkgver=1.1
pkgrel=1
pkgdesc="Precision Lisp editing with Evil and Lispy"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-evil' 'emacs-lispy' 'emacs-hydra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/master.zip")
sha256sums=('b40df38ff30153314eaaa81cc767452175661f8a1acc7ad924f19fc5ad0dc91c')
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
