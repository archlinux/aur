# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=pkg-info.el
_pkgmaintainer=lunaryorn
_pkgdestdirname=pkg-info
_versionprefix=
pkgver=0.6
pkgrel=1
pkgdesc="Provide information about Emacs packages"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-epl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('a5e5123f96bfa635c67ea64cf8df2b3a29e448f6ec2116de13a0d65af494c1bf')

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
