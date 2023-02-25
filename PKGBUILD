# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ssdfs-tools
pkgver=4.09
pkgrel=1
pkgdesc="SSDFS file system utilities"
arch=('i686' 'x86_64')
url="https://github.com/dubeyko/ssdfs-tools"
license=('BSD')
depends=('libblkid.so' 'libuuid.so' 'zlib')
makedepends=('linux-api-headers' 'util-linux')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/dubeyko/ssdfs-tools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06a283e8883aed9d4c9a38684ac54bcb6a73a0873fc162595ddbf3ff4f74f729')


build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin"
  make
}

check() {
  cd "$pkgname-$pkgver"

  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/ssdfs-tools"
}
