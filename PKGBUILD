# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=1.16.1
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
		0001-ocaml-allow-callbacks-to-be-run-outside-of-block.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < "${srcdir}/0001-ocaml-allow-callbacks-to-be-run-outside-of-block.patch"
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

sha256sums=('287755d8ba24ed7e71c09a3c97cb5152d0af01e9d33386e0868fc6de07dee576'
            'SKIP'
            '20b11c9b0eedb40a46c47f00705ef77a15a1bc8e0087d561fa7558a741b99712')
