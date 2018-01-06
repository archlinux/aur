# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Achraf cherti <achrafcherti@gmail.com>

pkgname=gshutdown
pkgver=0.2
pkgrel=5
pkgdesc="An advanced shutdown utility"
arch=('x86_64')
url="http://gshutdown.tuxfamily.org"
license=('GPL')
depends=('libglade' 'libnotify')
makedepends=('pkg-config')
source=(https://gshutdown.tuxfamily.org/release/$pkgname-$pkgver.tar.gz
	build-fix.patch)
sha256sums=('bb316be18e3573f983aff5a038603ed10a9df9dd9c7efde65b759aaf1221169f'
            '48b7123b71172d0e9e1d5b0e5ce7b09f297f828ccb1b39838a11716b4df6c655')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 <"$srcdir"/build-fix.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS="-lX11 -lXau" ./configure --prefix=/usr --mandir=/usr/share
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
