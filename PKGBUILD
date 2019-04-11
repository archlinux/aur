# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.12.0
pkgrel=1
pkgdesc="NBD server toolkit"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/nbdkit"
license=('custom: BSD')
depends=()
optdepends=('libvirt' 'lua' 'tcl' 'perl')
makedepends=('autoconf')
source=("https://github.com/libguestfs/nbdkit/archive/v${pkgver}.tar.gz")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir" install
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

sha256sums=('d0918bf1d8bf11a640e967a0a7879a104de970d6406180ceb2c90cb811c5fc90')
