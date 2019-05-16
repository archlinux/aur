# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=hydra
_pkgmaintainer=abo-abo
_pkgdestdirname=hydra
_versionprefix=
pkgver=0.15.0
pkgrel=1
pkgdesc="Make Emacs bindings that stick around"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
optdepends=('emacs-org-mode: Comes with an org-mode export widget')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('a329ed62ed4d6c309f3e151fdfe77dae3fa3b7e4226bd26859ea1115ded2cd80')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile {hydra-ox,hydra,lv}.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 {hydra-ox,hydra,lv}.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
