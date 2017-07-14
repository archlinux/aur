# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=emacs-twiki-mode
_pkgmaintainer=christopherjwhite
_pkgdestdirname=twiki-mode
_versionprefix=
pkgver=1.3.1
pkgrel=1
pkgdesc="Major mode for editing Twiki wiki files for emacs, plus 'twikish' command line tool to retrieve and save twiki pages from text files."
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('3339ba8e508a3e737bd54ace7265154efe25bd8b5e310e47db6ae63990623ab1')
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
