# Maintainer: willemw <willemw12@gmail.com>
# Contributor: gnomeye <gnomeye at gmail dot com>

_srcname=ts
pkgname=task-spooler
pkgver=1.0.1
pkgrel=1
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('x86_64')
url="http://vicerveza.homeunix.net/~viric/soft/ts/"
license=('GPL')
#source=(http://ftp.debian.org/debian/pool/main/t/task-spooler/task-spooler_$pkgver.orig.tar.gz)
source=(http://vicerveza.homeunix.net/~viric/soft/$_srcname/$_srcname-$pkgver.tar.gz)
md5sums=('21dc21a63645cad2464be4b52bb12dd8')

build() {
  cd $_srcname-$pkgver
  make
}

package() {
  cd $_srcname-$pkgver

  install -Dm644 TRICKS "$pkgdir/usr/share/doc/$pkgname/TRICKS"

  make PREFIX="$pkgdir/usr" install

  # Rename ts to tsp (as in Debian). File /usr/bin/ts is owned by package community/moreutils.
  mv "$pkgdir"/usr/bin/{ts,tsp}
  mv "$pkgdir"/usr/share/man/man1/{ts,tsp}.1
}

