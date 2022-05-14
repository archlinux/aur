# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=xf86-input-mtrack
pkgver=0.5.1
pkgrel=2
pkgdesc="An Xorg driver for multitouch trackpads and clickpads"
arch=('i686' 'x86_64')
url="https://github.com/p2rkw/$pkgname"
license=('GPL2')
depends=('mtdev' 'libxss')
makedepends=('xorg-server-devel' 'xorgproto' 'pixman')
backup=('etc/X11/xorg.conf.d/10-mtrack.conf')
source=(10-mtrack.conf
        10-mtrack-advanced.conf
        10-mtrack-apple-magic-trackpad.conf
        "git+https://github.com/p2rkw/xf86-input-mtrack#tag=124b80f3913e44cc7fdc1ac36a639252f7c4bf1b")
sha256sums=('5e0bc6ee814165be31e0265842f066c290b544757451d15c7e6eb370d4c0e356'
            '050cc4c654c91ac8332f55dff5ebbda8e85a665ed37da4fa98e7050aa48ff43e'
            '3554eae21a367886212fba32d21e82972ada939b82105e133beeb69b2129e8d8'
            'SKIP')

build() {
  cd "$srcdir"/"$pkgname"

  mkdir -p m4

  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/"$pkgname"
  make DESTDIR="$pkgdir"/ install

  mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"/
  cp "$srcdir"/"$pkgname"/README.md "$pkgdir"/usr/share/doc/"$pkgname"
  cp "$srcdir"/10-mtrack.conf "$pkgdir"/usr/share/doc/"$pkgname"
  cp "$srcdir"/10-mtrack-advanced.conf "$pkgdir"/usr/share/doc/"$pkgname"
  cp "$srcdir"/10-mtrack-apple-magic-trackpad.conf "$pkgdir"/usr/share/doc/"$pkgname"
  echo ""
  echo "Use one of the examples in /usr/share/doc/xf86-input-mtrack"
}
