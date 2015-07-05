# Contributors:
#   henning mueller <mail@nning.io>

pkgname=paxctld
pkgver=1.0
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
  http://grsecurity.net/paxctld/paxctld_1.0.orig.tar.gz{,.sig}
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

sha256sums=('94b319e0c506fe42bd610247a8997758d7409d92fd94dd28621d7641006b6ed0'
            'SKIP'
            'bedd98fa6bd95ff00af420e6ca1811f792825d9fb9078218e16b78653ad74cff')
