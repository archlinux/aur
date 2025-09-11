# Maintainer: Alexander Courtis <alex@courtis.org>
pkgname=xlayoutdisplay
pkgver=1.5.1
pkgrel=1
pkgdesc="Detects and arranges linux display outputs, using XRandR for detection and xrandr for arrangement."
arch=('x86_64')
url="https://github.com/alex-courtis/xlayoutdisplay"
license=('Apache')
depends=('xorg-xrandr' 'xorg-xrdb' 'libxcursor')
makedepends=('git' 'make' 'boost')
source=("https://github.com/alex-courtis/xlayoutdisplay/archive/v$pkgver.tar.gz")
sha256sums=('6580688ee1cbe2f0c8ed500d7048e1fa96550c3e7fd711d419f437cbe3ddec49')
install=install

build() {
	cd "$pkgname-$pkgver"
	make xlayoutdisplay
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
	install -Dm644 README.md               -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 99-xlayoutdisplay.rules -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE                 -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 NOTICE                  -t "$pkgdir/usr/share/licenses/$pkgname"
}
