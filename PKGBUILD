# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=wm2
pkgver=4
pkgrel=2
pkgdesc="The ideal window manager for today's elegant and ascetic programmer"
arch=('x86_64' 'i686')
url='http://www.all-day-breakfast.com/wm2/'
license=('custom')
depends=('libxmu')
makedepends=('setconf')
source=("http://www.all-day-breakfast.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a6c3352390f958c5033408ce73e1abd9677372a7c8c5949e39a62fda433b054d')

build() {
  cd "$pkgname-$pkgver"
  
  setconf Makefile LIBS	"-L/usr/X11/lib -lXext -lX11 -lXmu -lm -lstdc++"
  setconf Makefile CFLAGS "$CFLAGS -fpermissive"
  make
  tail -31 README | head -20 > LICENSE
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
