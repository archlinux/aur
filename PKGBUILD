# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=find-file-in-project
_pkgmaintainer=technomancy
_pkgdestdirname=find-file-in-project
_versionprefix=
pkgver=5.7.10
pkgrel=1
pkgdesc="Quick access to project files in Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-swiper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('6459ac7e592d5910f3416eaa810bb867af86098de47c93bb3b6c733c7f427bb8')
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
