# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=find-file-in-project
_pkgmaintainer=technomancy
_pkgdestdirname=find-file-in-project
_versionprefix=
pkgver=5.7.2
pkgrel=1
pkgdesc="Quick access to project files in Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-swiper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('a5c3d2280300c4343139dc10053bde24dfe8f86619aeed26a1c5de3d96dd7de0')
install=${pkgname}.install

build() {
  cd "${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${_pkgsrcname}-${pkgver}"
  mkdir -p "$pkgdir"/usr/share/emacs/site-lisp/${_pkgdestdirname}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_pkgdestdirname}/
}
