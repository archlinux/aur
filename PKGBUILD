# Maintainer: robertfoster

pkgname=libsmacker
pkgver=1.2.0r43
pkgrel=3
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

sha256sums=('e259b0ea31d205f490d840c5612ab8fb9c8f6f738cbafd0cbb8ddb2e89ad42ab'
  '46190ae6101ef8505522b55a905be3301a5ab3eb23d333c6d307187bd9a9cbf0'
  '78ef757866194e2a94181d3ec01018dd1d7c3f1bf1c12942a277cf2aa3623142')
