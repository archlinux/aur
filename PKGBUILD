# Maintainer: willemw <willemw12@gmail.com>
# Contributor: gnomeye <gnomeye at gmail dot com>

_srcname=ts
pkgname=task-spooler
pkgver=1.0.1
pkgrel=4
#pkgdesc="Personal job scheduler"
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('x86_64')
#url="https://vicerveza.homeunix.net/~viric/soft/ts/"
#url="https://viric.name/soft/ts/"
url="https://tracker.debian.org/pkg/task-spooler/"
license=('GPL')
#source=(https://vicerveza.homeunix.net/~viric/soft/$_srcname/$_srcname-$pkgver.tar.gz)
source=(https://ftp.debian.org/debian/pool/main/t/$pkgname/${pkgname}_$pkgver+dfsg1.orig.tar.xz)
md5sums=('6cd744c43f36d432f303957d60474570')

build() {
  cd $_srcname-$pkgver
  make
}

package() {
  cd $_srcname-$pkgver

  install -Dm644 TRICKS "$pkgdir/usr/share/doc/$pkgname/TRICKS"

  make PREFIX="$pkgdir/usr" install

  # Rename ts to tsp, which is also done in other distros.
  # File /usr/bin/ts is owned by package community/moreutils.
  mv "$pkgdir"/usr/bin/{ts,tsp}
  mv "$pkgdir"/usr/share/man/man1/{ts,tsp}.1
}

