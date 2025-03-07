# Maintainer: Mobin Aydinfar <mobin@mobintestserver.ir>
pkgname=dinit
pkgver=0.19.3
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(make)
sha256sums=('3a78b70948b496a73c708693f43c85cf58d7e63e0fcb844c621431264e69aa1b')

build() {
  cd "$pkgname-$pkgver"
  ./configure --sbindir="/usr/bin" --shutdown-prefix="dinit-"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
  make check-igr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
