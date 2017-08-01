# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=cucumber.el
_pkgmaintainer=michaelklishin
_pkgdestdirname=feature-mode
_versionprefix=v
pkgver=0.4
pkgrel=2
pkgdesc="Emacs mode for editing Cucumber plain text stories (feature-mode)"
pkgname=emacs-cucumber
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('5594c01eeba896ca47b2815aad8323cde1f0a49dce957a6f71eb862ff13ea303')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  pkgdest="${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  mkdir -p "${pkgdest}/snippets/feature-mode/"

  install -m644 *.el{c,} $pkgdest
  install -m644 *.yml $pkgdest
  install -m644 snippets/feature-mode/* "${pkgdest}/snippets/feature-mode/"
}
