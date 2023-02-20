# Maintainer: willemw <willemw12@gmail.com>
# Contributor: gnomeye <gnomeye at gmail dot com>

_srcname=ts
pkgname=task-spooler
pkgver=1.0.2
pkgrel=1
#pkgdesc="Personal job scheduler"
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('x86_64')
#url="https://tracker.debian.org/pkg/task-spooler/"
#url="https://vicerveza.homeunix.net/~viric/soft/ts/"
url="https://viric.name/soft/ts/"
license=('GPL')
#source=(https://ftp.debian.org/debian/pool/main/t/$pkgname/${pkgname}_$pkgver+dfsg1.orig.tar.xz)
#source=(https://vicerveza.homeunix.net/~viric/soft/$_srcname/$_srcname-$pkgver.tar.gz)
source=(https://viric.name/soft/$_srcname/$_srcname-$pkgver.tar.gz)
sha256sums=('f73452aed80e2f9a7764883e9353aa7f40e65d3c199ad1f3be60fd58b58eafec')

build() {
  make -C $_srcname-$pkgver
}

package() {
  install -Dm644 $_srcname-$pkgver/TRICKS -t "$pkgdir/usr/share/doc/$pkgname"
  make -C $_srcname-$pkgver PREFIX="$pkgdir/usr" install

  # Rename ts to tsp, which is also done in other distros.
  # File /usr/bin/ts is owned by package community/moreutils.
  mv "$pkgdir"/usr/bin/{ts,tsp}
  mv "$pkgdir"/usr/share/man/man1/{ts,tsp}.1
}

