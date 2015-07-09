# Maintainer: James An <james@jamesan.ca>
# Contributor: Edgar Hucek <gimli at dark-green dot com>

pkgname=macfanctld
pkgver=0.6
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Fan control daemon for MacBook"
url="https://github.com/MikaelStrom/macfanctld"
license="GPL3"
makedepends=('gcc')
depends=('glibc')
backup=('etc/macfanctl.conf')
source=(
  "https://github.com/MikaelStrom/$pkgname/archive/master.tar.gz"
  "$pkgname.service"
)
md5sums=('d1a42fe34cbb4e830bed5547bef969df'
         '3ae082c7be885c8427eee8108393fc90')

prepare() {
  cd "$pkgname-master"

  gzip -9f macfanctld.1
}

build() {
  cd "$pkgname-master"

  make
}

package() {
  cd "$pkgname-master"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${pkgname%d}.conf" "$pkgdir/etc/${pkgname%d}.conf"
  install -Dm644 "$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"

  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
