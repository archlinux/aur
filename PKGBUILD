# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=nbdkit
pkgver=1.24.3
pkgrel=2
pkgdesc="NBD server toolkit"
arch=('i686' 'x86_64')
url="https://github.com/libguestfs/nbdkit"
license=('custom: BSD')
depends=()
optdepends=('libvirt' 'lua' 'tcl' 'perl' 'rust' 'libnbd')
checkdepends=('qemu')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0')
_dldir="${pkgver%.*}"
source=(
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz"
		"http://download.libguestfs.org/nbdkit/${_dldir}-stable/nbdkit-${pkgver}.tar.gz.sig"
)


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

sha256sums=('62ecc8daaf7aa189d211ea5b56c67b611a98285b71025583905fed6736b84207'
            'SKIP')
