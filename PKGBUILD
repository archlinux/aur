# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=1.16.3
pkgrel=1
pkgdesc="NBD client library in userspace"
arch=('x86_64')
url="https://gitlab.com/nbdkit/libnbd"
license=('LGPL2.1')
depends=()
makedepends=('perl')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0' '71C2CC22B1C4602927D2F3AAA7A16B4A2527436A')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/libnbd/${_dldir}-stable/libnbd-${pkgver}.tar.gz"
		"http://download.libguestfs.org/libnbd/${_dldir}-stable/libnbd-${pkgver}.tar.gz.sig"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

sha256sums=('dacb6aa278e66da5b7dc94f5012b51601db0908db733c15f688079165795cf39'
            'SKIP')
