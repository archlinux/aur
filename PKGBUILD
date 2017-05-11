# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=evil-visualstar
_pkgmaintainer=bling
_pkgdestdirname=evil-visualstar
_versionprefix=v
pkgver=0.2.0
pkgrel=1
pkgdesc="Start a * or # search from the visual selection"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-evil')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('6a6e470283d6b5063bf20e503bb72d1cc17ce6e77fe8bca8dde76805a0eff0dc')
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
