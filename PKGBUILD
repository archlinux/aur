# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Friedrich Weber <fred@reichbier.de>
pkgname=czmq
pkgver=3.0.2
pkgrel=1
pkgdesc="High-level C binding for 0MQ"
arch=('i686' 'x86_64')
url="http://czmq.zeromq.org"
license=('MPL2')
depends=('zeromq>=4.0')
sha1sums=('7dab11e439b3767eaaa3ace2ad63a92c6fb4d781')
makedepends=()
source=(https://github.com/zeromq/czmq/archive/v${pkgver}.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make $MAKEFLAGS
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/bin/makecert" "$pkgdir/usr/bin/makecert.czmq"
}
