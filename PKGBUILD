# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=force_bind
pkgver=0.12
pkgrel=2
pkgdesc='Force binding on a specific IP and/or port, change TTL/TOS/KA/MSS/REUSEADDR/FWMARK/PRIORITY. Works with both IPv4 and IPv6. Also, you can enforce bandwidth per process or per socket'
url='http://kernel.embedromix.ro/us/'
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
source=(
  "http://kernel.embedromix.ro/us/$pkgname/$pkgname-$pkgver.tar.gz"
  "$pkgname.1"
  "${pkgname}_null-to-strcmp-fix.patch")
sha512sums=(
  '30e704acb7b4f000966838458c40bef558e9c84aeffe363c4a7ebf462f706c3723afdc4fdd9dd372d94317f16bca88dd0bfea3b5b41494c8dbf3cfb9ece73ad9'
  'df73d0db4d9c3056c3def54d85b23c7f251528873715e7026d5d3f07ef9d3888b0f733cbbb3c333b4ac25ad97c797f6f2f8db37fa8025105104a3acc788bdce3'
  '3e33eb1158dd89737fa62c018ff5af0419a3900315875363f30194c8ae0cceecd943d2c8e1f139127f5b092c428597f1a570ff072c0c29a60082bc6b990f4be9')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../${pkgname}_null-to-strcmp-fix.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
