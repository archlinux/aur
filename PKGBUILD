# Maintainer: lesto <lestofante88@gmail.com>

pkgname=freedns-daemon
pkgver=2.0
pkgrel=2
pkgdesc="Lighweight, barebone and almost dependency free daemon for freedns.afraid.org"
arch=('any')
url="http://www.github.com/lestofante/freedns"
urlgit="http://www.github.com/lestofante/freedns.git"
license=('GPL')
depends=('curl' 'bash')
makedepends=()
install='freedns-daemon.install'
backup=('usr/bin/freedns-daemon.sh')
changelog=
source=("$pkgname-$pkgver"::"git+$urlgit#tag=$pkgver")
md5sums=('SKIP')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	chmod +x ./freedns-daemon.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  cp freedns-daemon.sh "$pkgdir/usr/bin/"
  
  mkdir -p "$pkgdir/etc/freedns-daemon/"
  echo '#place here your direct url, should be something similar to "http://freedns.afraid.org/dynamic/update.php?BLABLABLABALBALdasdsadas=="' > "$pkgdir/etc/freedns-daemon/urls"
  
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp freedns-daemon.service "$pkgdir/usr/lib/systemd/system/"
}
