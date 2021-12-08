# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=extract_url
_pkgname=extracturl
pkgver=1.6.2
pkgrel=1
pkgdesc="Extracts URLs from MIME email messages or plain text"
arch=("any")
url="http://www.memoryhole.net/~kyle/extract_url/"
license=("BSD")
depends=("perl" "perl-mime-tools" "perl-html-parser")
optdepends=(
  'perl-uri-find: Recognize more exotic URL variations in plain text'
  'perl-curses-ui: Allows full replacement for urlview'
  'perl-term-readkey: Used to determine terminal width in a portable way')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/m3m0ryh0l3/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("5f0b568d5c9449f477527b4077d8269f1f5e6d6531dfa5eb6ca72dbacab6f336")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -m644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
