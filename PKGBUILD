# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=thumbdrives
pkgver=0.3.2
pkgrel=1
pkgdesc='Thumbdrive and ISO emulator for phones'
url='https://git.sr.ht/~martijnbraam/thumbdrives'
license=('MIT')
arch=('any')
depends=('python-xdg' 'python-gobject' 'libhandy0' 'libblockdev' 'libibus' 'gst-editing-services' 'xapp' 'libgexiv2' 'gom')
makedepends=('meson')
source=("https://git.sr.ht/~martijnbraam/thumbdrives/archive/$pkgver.tar.gz")
sha512sums=('1594a303e375ca489fbe671e6917013c6d32239d8dfe325616ba94da81ca95cbe82fe0cb719f91a0f78e1b18d59713048899442749ead0a0cdd29508a0bea1d6')

build() {
  cd $pkgname-$pkgver
  meson --prefix=/usr ../build
  ninja -v -C ../build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" meson install -C ../build
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
