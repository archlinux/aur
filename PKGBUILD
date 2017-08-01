# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=evil-magit
_pkgmaintainer=emacs-evil
_pkgdestdirname=evil-magit
_versionprefix=v
pkgver=0.4.1
pkgrel=1
pkgdesc="Black magic or evil keys for magit"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-magit-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('c37edd5e48f078747516fcac1b681a5b1cec2b3f3089e6bd9bc26e3ae0e4a08b')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile $_pkgsrcname.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 $_pkgsrcname.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
