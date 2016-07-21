# Contributors:
#   henning mueller <mail@nning.io>

pkgname=paxctld
pkgver=1.2
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

sha256sums=('3117da5e21fd3c5c544cb30cc3967ed765c5ece35f3383e2e6345fd006bf9a25'
            'SKIP'
            'bedd98fa6bd95ff00af420e6ca1811f792825d9fb9078218e16b78653ad74cff')
