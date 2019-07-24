# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libnbd
pkgver=0.1.8
pkgrel=1
pkgdesc="NBD client library in userspace"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/libnbd"
license=('custom: BSD')
depends=()
optdepends=('ocaml' 'gnutls' 'libxml2' 'python')
makedepends=('autoconf' 'perl')
source=("https://github.com/libguestfs/libnbd/archive/v${pkgver}.tar.gz")


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

sha256sums=('5953204412704daff2047bf9456a7f94c074c877cdc5d33e6915a1627e4ecf45')
