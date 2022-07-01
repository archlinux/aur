# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=1.12.4
pkgrel=1
pkgdesc="NBD client library in userspace"
arch=('i686' 'x86_64')
url="https://gitlab.com/nbdkit/libnbd"
license=('LGPL2.1')
depends=()
makedepends=('perl')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0' '71C2CC22B1C4602927D2F3AAA7A16B4A2527436A')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/libnbd/${_dldir}-stable/libnbd-${pkgver}.tar.gz"
		"http://download.libguestfs.org/libnbd/${_dldir}-stable/libnbd-${pkgver}.tar.gz.sig"
		fs74747.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < "${srcdir}/fs74747.patch"
}

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

sha256sums=('2085b09b6a9067112113a68333e4d90040c821f9dab12caab4cebdedfd6a7f50'
            'SKIP'
            '7e6e1c11ea571e4e7eca6d5c6417f63b6063295b761abf417726167e4e413623')
