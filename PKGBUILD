# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=find-file-in-project
_pkgmaintainer=technomancy
_pkgdestdirname=find-file-in-project
_versionprefix=
pkgver=6.2.1
pkgrel=1
pkgdesc="Quick access to project files in Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-swiper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('815e2bd8c71e5061fe0becb6cad9983a92fc69aa47704fca46f1c22f77f1f075')
install=${pkgname}.install

build() {
  cd "${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${_pkgsrcname}-${pkgver}"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
