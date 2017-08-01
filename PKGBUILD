# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=magit-gitflow
_pkgmaintainer=jtatarik
_pkgdestdirname=magit-gitflow
_versionprefix=
pkgver=2.2.2
pkgrel=1
pkgdesc="GitFlow plugin for magit.el"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-magit-git' 'gitflow-avh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('3c27a19ee25eca66e26aef1c54cefd952fcdd1b7de9114a041665fc4ef480a94')
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
