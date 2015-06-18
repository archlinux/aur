# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: CRT <crt.011@gmail.com>
# Contributor: Sébastien Duquette <ekse.0x@gmail.com>
# Contributor: icarus <icarus.roaming@gmail.com>
# Contributor: Stephane Travostino <stephane.travostino@gmail.com>

pkgname=cowpatty
pkgver=4.6
pkgrel=6
pkgdesc="Wireless WPA/WPA2 PSK handshake cracking utility"
url="http://www.willhackforsushi.com/?page_id=50"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl' 'libpcap')
options=('docs' '!makeflags')
source=(http://www.willhackforsushi.com/code/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz
        cowpatty-4.6-fixup16.patch)
sha512sums=('87c55f3f43c0342cbcc46227a1e4cfe3f23e215adc68e376991b85344b00b56e7b57e3cf0f1e3d18378cd830a247b2e36644b41b5c0f00a2a382b410f4ab35af'
            'ad98cbf6abc2e08e15eba733d0e572c1ae08559dc458da7c07c5def920fd1d1885c63635f464533062fef9dcf31eb55dcdfff62936fdeb25f23d1e60da3b5990')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -ri 's|(= -pipe)|+\1|g' Makefile
  patch -p1 < ../cowpatty-4.6-fixup16.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make all strip 
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
  install -Dm 644 dict "${pkgdir}/usr/share/cowpatty/dict"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
