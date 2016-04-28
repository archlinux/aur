# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu
# Contributor: Elis Hughes <elishughes@googlemail.com>

pkgname=lib32-librtmp0
pkgver=2.3
pkgrel=1
pkgdesc='Library to download rtmp streams (32-bit, legacy version)'
arch=('x86_64')
url='http://rtmpdump.mplayerhq.hu/'
license=('GPL2' 'LGPL2.1')
depends=('lib32-glibc' 'lib32-openssl' 'lib32-zlib')
options=('!makeflags')
source=("https://rtmpdump.mplayerhq.hu/download/rtmpdump-${pkgver}.tgz")
sha256sums=('ef38b7a99d82ce6912063d21063aeaf28185341b3df486e24bffce5354224b2c')

build() {
  cd "rtmpdump-${pkgver}/librtmp"

  make \
    OPT="-m32 $CFLAGS" \
    LDFLAGS="-m32 $LDFLAGS"
}

package() {
  cd "rtmpdump-${pkgver}/librtmp"

  make \
    prefix='/usr' \
    sbindir='/usr/bin' \
    libdir='/usr/lib32' \
    mandir='/usr/share/man' \
    DESTDIR="${pkgdir}" \
    install

  rm -rf "${pkgdir}/usr/"{include,share,lib32/pkgconfig}
}

# vim: ts=2 sw=2 et:
