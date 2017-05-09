# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=jinja2-mode
_pkgmaintainer=paradoxxxzero
_pkgdestdirname=jinja2-mode
_versionprefix=v
pkgver=0.2
pkgrel=1
pkgdesc="Jinja2 mode for emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('f67661042da8323cd3adcd2aa83f02d7ea13cd8a7f1de904fb42d1199692fd31')
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
