# Contributors:
#   henning mueller <mail@nning.io>

pkgname=paxctld
pkgver=1.1
pkgrel=1
pkgdesc='PaX flags maintenance daemon'
arch=(i686 x86_64)
url=http://grsecurity.net
license=(GPL)
depends=(glibc)
backup=(
  etc/$pkgname.conf
)
source=(
  http://grsecurity.net/paxctld/paxctld_$pkgver.orig.tar.gz{,.sig}
  $pkgname.service
)

validpgpkeys=(
  DE9452CE46F42094907F108B44D1C0F82525FE49
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's:sbin:usr/bin:' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

sha256sums=('95c2805dc46edd443afceef283adf09943c6a62858944b516c9f5c0e06f8e99f'
            'SKIP'
            'bedd98fa6bd95ff00af420e6ca1811f792825d9fb9078218e16b78653ad74cff')
