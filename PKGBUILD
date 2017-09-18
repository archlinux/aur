# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=goatattack-server
_dlname=goatattack
pkgver=0.4.5
pkgrel=2
pkgdesc="A fast-paced multiplayer pixel art shooter game."
arch=("any")
url="http://www.goatattack.net/"
license=('GPL')
depends=("libpng")
makedepends=("gc")
source=("https://github.com/$_dlname/$_dlname/archive/$pkgver.tar.gz")
md5sums=('58a8b282ecdd87d0c3012103b1a44dff')

prepare() {
	cd "$srcdir/$_dlname-$pkgver"
	autoreconf -i
	CPPFLAGS="-I/usr/include/freetype2" ./configure --prefix=/usr --enable-dedicated-server --program-suffix="-server" --datadir="/usr/share/$pkgname"
}

build() {
	cd "$srcdir/$_dlname-$pkgver"
	make
}

check() {
	cd "$srcdir/$_dlname-$pkgver"
	make
}

package() {
	cd "$srcdir/$_dlname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install goatattack-server.system /usr/lib/systemd/system/
}
