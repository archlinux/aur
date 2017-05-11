# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=guide-key
_pkgmaintainer=kai2nenobu
_pkgdestdirname=guide-key
_versionprefix=v
pkgver=1.2.5
pkgrel=1
pkgdesc="Guide following keys to an input key sequence automatically and dynamically in Emacs."
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-s' 'emacs-popwin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('b090bde7f6ee06a2f4d1773496387759962475b62870f99102850167648a4c99')
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
