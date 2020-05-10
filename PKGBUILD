# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=xf86-input-mtrack
pkgver=0.5.0
pkgrel=3
pkgdesc="An Xorg driver for multitouch trackpads and clickpads"
arch=('i686' 'x86_64')
url="https://github.com/p2rkw/$pkgname"
license=('GPL2')
depends=('mtdev' 'libxss')
makedepends=('xorg-server-devel' 'xorgproto' 'pixman')
backup=('etc/X11/xorg.conf.d/10-mtrack.conf')
source=(10-mtrack.conf
        $url/archive/v$pkgver.tar.gz)
sha256sums=('5e0bc6ee814165be31e0265842f066c290b544757451d15c7e6eb370d4c0e356'
            'a976723720028832afd45bfcaab479f60833ff6f1c780be727d1791675dc14c4')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p m4

  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir"/ install

  install -Dm644 "$srcdir"/10-mtrack.conf "$pkgdir"/etc/X11/xorg.conf.d/10-mtrack.conf
}
