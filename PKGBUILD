# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=git-timemachine
_pkgmaintainer=pidu
_pkgdestdirname=git-timemachine
_versionprefix=
pkgver=3.0
pkgrel=1
pkgdesc="Step through historic versions of git controlled file using everyone's favourite editor"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('4ac73d87d6d5fbee96fad5f4f6cdf36b94d6ee227b80cdbd96363b9e4c068fd0')
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
