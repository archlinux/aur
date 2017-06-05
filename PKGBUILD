# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=lispy
_pkgmaintainer=abo-abo
_pkgdestdirname=lispy
_versionprefix=
pkgver=0.26.0
pkgrel=1
pkgdesc="Short and sweet LISP editing"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-avy' 'emacs-iedit' 'emacs-swiper' 'emacs-org-mode')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('f463c5245d5f58b9df4952dacf745a28b023da7b9da5c4e92fbcaacd4a7af195')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  rm -f lispy-test.el
  rm -f elpa.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
