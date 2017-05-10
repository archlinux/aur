# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=hydra
_pkgmaintainer=abo-abo
_pkgdestdirname=hydra
_versionprefix=
pkgver=0.13.0
pkgrel=1
pkgdesc="Make Emacs bindings that stick around"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
optdepends=('emacs-org-mode: Comes with an org-mode export widget')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('93023bd90722cf5e12134c2cfa6b9fd640224641e8afde41ea47caf1a89cd6a7')
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
