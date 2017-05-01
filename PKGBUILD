# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-iedit
pkgver=0.90
pkgrel=3
pkgdesc="Edit multiple regions with the same content simultaneously"
arch=(any)
url="https://github.com/tsdh/iedit"
license=('GPL3')
depends=('emacs')
source=("https://github.com/tsdh/iedit/archive/${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/tsdh/iedit/master/iedit-lib.el"
        "https://raw.githubusercontent.com/tsdh/iedit/master/iedit-rect.el")
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el

  cd "${srcdir}/iedit-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/iedit/"

  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/iedit/"

  cd "${srcdir}/iedit-${pkgver}"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/iedit/"
}
