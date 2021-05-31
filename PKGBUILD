# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=thumbdrives
pkgver=0.3.1
pkgrel=2
pkgdesc='Thumbdrive and ISO emulator for phones'
url='https://git.sr.ht/~martijnbraam/thumbdrives'
license=('MIT')
arch=('any')
depends=('dconf' 'hicolor-icon-theme' 'python-xdg' 'python-gobject' 'libhandy0')
makedepends=('meson')
source=("https://git.sr.ht/~martijnbraam/thumbdrives/archive/$pkgver.tar.gz")
sha512sums=('3d4d901975ef1f3ccda6df9a371944702f28ba4590ab9b3758f53b2f38bd5aa666660d720428836f99c6a7adb6333399e3991c6a641273f72fa9c4e0ec2362b2')

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
