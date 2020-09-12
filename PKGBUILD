# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: sballert <sballert at posteo dot de>
# Contributor: Alex Whitt <alex dot joseph dot whitt at gmail dot com>

_pkgsrcname=emacs-which-key
_pkgmaintainer=justbur
_pkgdestdirname=which-key
_versionprefix=v
pkgver=3.5.0
pkgrel=1
pkgdesc="Emacs package that displays available keybindings in popup"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('0e8d9a5c420c739a956fd76c23669da34f80281c0a39bb3134e4e3154190294b')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile which-key.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 which-key.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
