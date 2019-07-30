# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=youtube-dl-emacs
_pkgmaintainer=skeeto
pkgver=1.0
pkgrel=1
pkgdesc="A youtube-dl download manager for Emacs"
pkgname=emacs-youtube-dl
arch=('any')
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-s' 'emacs-dash')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('4189555f39d9bd3eb288a1e0ae6e77217e63a71ef2c2d4343a7a2ff098f37437')

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}"/${_pkgsrcname}-${pkgver}
  mkdir -p "${pkgdir}"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp
}
