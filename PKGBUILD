# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=1.0.0
pkgrel=1
pkgdesc="NBD client library in userspace"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/libnbd"
license=('custom: BSD')
depends=()
optdepends=('ocaml' 'gnutls' 'libxml2' 'python')
makedepends=('autoconf' 'perl')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
source=(
		"http://download.libguestfs.org/libnbd/1.0-stable/libnbd-${pkgver}.tar.gz"
		"http://download.libguestfs.org/libnbd/1.0-stable/libnbd-${pkgver}.tar.gz.sig"
)


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m644 -D COPYING.LIB "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir" install
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

sha256sums=('7740f2d3fa9fdd316f010d83d87a8c7f80c1c1a2bac40fdf64301fa5dc942452'
            'SKIP')
