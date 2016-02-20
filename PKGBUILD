# Maintainer: Sardelli Tommaso <lacappannadelloziotom [at] gmail [dot] com>

pkgname=ympd
pkgver=1.3.0
pkgrel=3
pkgdesc="A standalone MPD Web GUI"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.ympd.org"
license=('GPL2')
depends=('libmpdclient' 'openssl')
makedepends=('cmake')
provides=("$pkgname")
conflicts=("$pkgname-git")
install="${pkgname}.install"
backup=('etc/default/ympd')
source=("https://github.com/notandy/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d9f68920cd93d1cfa971e1d7b9162a2b1724909bc9753c1338cecb3688d234d5')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p build && cd build;
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir/" install
  install -Dm644  "$srcdir/$pkgname-$pkgver/contrib/ympd.service" "$pkgdir/usr/lib/systemd/system/ympd.service"
  install -Dm644  "${srcdir}/$pkgname-$pkgver/contrib/ympd.default" "$pkgdir/etc/default/ympd"
}

# vim:set ts=2 sw=2 et:
