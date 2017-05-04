# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=pcap-mode
_pkgmaintainer=orgcandman
_pkgdestdirname=pcap-mode
_versionprefix=
pkgver=0.2
pkgrel=1
pkgdesc="Emacs lisp pcap file viewer"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL2')
depends=('emacs' 'wireshark-cli')
source=("$pkgname-$pkgver.zip::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/master.zip")
md5sums=('7159de23bbb98b9f101ba4452ff456aa')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-master"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-master"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
