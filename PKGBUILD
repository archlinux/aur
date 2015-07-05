# Maintainer: Sardelli Tommaso <lacappannadelloziotom [at] gmail [dot] com>

pkgname=ympd
pkgver=1.2.3
pkgrel=1
pkgdesc="A standalone MPD Web GUI"
arch=('i686' 'x86_64')
url="http://www.ympd.org"
license=('GPL2')
depends=('glibc' 'libmpdclient')
makedepends=('cmake' 'git')
optdepends=('openssl: SSL support in libwebsockets webserver')
source="https://github.com/notandy/$pkgname/archive/v$pkgver.tar.gz"
sha256sums=('092c26c51166d1d1f025cd06742981783dea7e42bfe4f73f10c4418fc003de94')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir build && cd build;
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir/" install
  install -Dm644  "$srcdir/$pkgname-$pkgver/contrib/ympd.service" "$pkgdir/usr/lib/systemd/system/ympd.service"
}

# vim:set ts=2 sw=2 et:
