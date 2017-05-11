# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=emacs-which-key
_pkgmaintainer=justbur
_pkgdestdirname=which-key
_versionprefix=v
pkgver=2.0.1
pkgrel=1
pkgdesc="Emacs package that displays available keybindings in popup"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('da687208d29e3905df3ece165615b6683cf3b007183cb3c7f7071aaf6c782038')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile which-key.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 which-key.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
