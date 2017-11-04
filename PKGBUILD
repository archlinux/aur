# Maintainer: Alan Witkowski <alan dot witkowski at gmail dot com>
pkgname=openflap
pkgver=1.0.1r45
pkgrel=1
pkgdesc="A game about bouncing balls through holes"
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/openflap"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
changelog=Changelog
source=("https://github.com/jazztickets/openflap/releases/download/v1.0.1/openflap-${pkgver}-src.tar.gz")
sha256sums=('69f0e3b8246ef964ef8e8e414d915ee4cc50bd03368d4a98b772af326001f296')

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
