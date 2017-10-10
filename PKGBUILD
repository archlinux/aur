# Maintainer: Alan Witkowski <alan dot witkowski at gmail dot com>
pkgname=openflap
pkgver=1.0.0r43
pkgrel=1
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
changelog=Changelog
source=("https://github.com/jazztickets/openflap/releases/download/v1.0.0/openflap-${pkgver}-src.tar.gz")
sha256sums=('7fb941fe57f7e1150037eb33b05f9b877f902766ef3a4d85a6bfcc704c1ec4da')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DNOVERSION=1 -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# remove standard license
	rm $pkgdir/usr/share/doc/$pkgname/LICENSE
}
