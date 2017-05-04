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
sha256sums=('96efc7e9fd5889f9f9a209d136b2a0bd896cab7a4be6b48952660d1147df33f9')
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
