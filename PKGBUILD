# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=emacs-ansible
_pkgmaintainer=k1LoW
_pkgdestdirname=ansible
_versionprefix=
pkgver=0.1.0
pkgrel=1
pkgdesc="Ansible minor mode for Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-s' 'emacs-f' 'emacs-yasnippet')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('0de0cf9d9506b3abf0c27e72eea47282e81abb3d8b7c2808f1ab401456d1aa8f')
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
