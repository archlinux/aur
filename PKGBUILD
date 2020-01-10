# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=find-file-in-project
_pkgmaintainer=technomancy
_pkgdestdirname=find-file-in-project
_versionprefix=
pkgver=5.7.9
pkgrel=1
pkgdesc="Quick access to project files in Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-swiper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('726dab38561c09b808ac9d8fef2f5a26ba009f1274499f3d06c9f13b3e6d72b1')
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
