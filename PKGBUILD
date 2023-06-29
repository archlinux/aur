# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=1.16.2
pkgrel=2
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

sha256sums=('644520e2925af1f45ca24934feda3cc8519a287f5f26cb4069f0244681d19463'
            'SKIP')
