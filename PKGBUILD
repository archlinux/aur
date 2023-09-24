# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=avy
_pkgdestdirname=avy
_pkgmaintainer=abo-abo
_versionprefix=
pkgver=0.5.0
pkgrel=1
pkgdesc="Jump to things in Emacs tree-style"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('8106ca3652ec8198fa88c17082f885b06ffd079dd4aac12cdc4f1c74942d2894')
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
