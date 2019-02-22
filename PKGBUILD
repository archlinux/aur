# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.11.5
pkgrel=1
pkgdesc="NBD server toolkit"
arch=('i686' 'x86_64')
url="http://www.volle-kraft-voraus.de/"
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

sha256sums=('e2bc461d0ac69f5e6c05e6ead699df32351cfb1a0f1ae070d0381ad63fcfdb1b')
