# Maintainer: robertfoster

pkgname=libsmacker
pkgver=1.1.1r35
pkgrel=2
pkgdesc="A C library for decoding .smk Smacker Video files"
arch=('i686' 'x86_64')
url="http://libsmacker.sourceforge.net"
license=('LGPL2.1')
depends=('glibc')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.pc"
  palette.patch)

prepare() {
  cd "${pkgname}-${pkgver%r*}"
  patch -Np1 -i ../palette.patch
  autoreconf -i
}

build() {
  cd "${pkgname}-${pkgver%r*}"
  ./configure --prefix=/usr
}

check() {
  cd "${pkgname}-${pkgver%r*}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver%r*}"
  make DESTDIR="${pkgdir}" install
  install -dm755 "${pkgdir}/usr/include"
  install -Dm644 ../"${pkgname}.pc" \
    "${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc"
  cp *.h ${pkgdir}/usr/include
}

sha256sums=('bb9c22c02ecda189a3389c9340a0eb6a8f287aa257099b54c3d9e1802a454630'
            '8ccac2d16943f15b0d3338261867673292091b664997c915206311b72e371155'
            '0a8ca9ce7a11106b6584c142b71cb034bf8ab4c6ce7603851f3b4aa9fd86bec2')
