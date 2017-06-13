# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=flycheck-pos-tip
_pkgmaintainer=flycheck
_pkgdestdirname=flycheck-pos-tip
_versionprefix=
pkgver=0.3
pkgrel=1
pkgdesc="Flycheck errors display in tooltip"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'flycheck' 'emacs-pos-tip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('adc8bf677e0c917b2f85d248b80ff9b7d90d93fdf7f605b78bcc7369a516fa2d')
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
