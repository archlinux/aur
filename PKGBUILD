# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=epl
_pkgmaintainer=cask
_pkgdestdirname=epl
_versionprefix=
pkgver=0.8
pkgrel=1
pkgdesc="Emacs Package Library"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('2cabc9324cf7a88abf1bc00c3fe2f79105e3170a005ab28453fb1537d4b02194')

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
