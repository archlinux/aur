# Maintainer: Aaron Paden <aaronbpaden@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=lib32-sdl_net
pkgver=1.2.8
pkgrel=1
pkgdesc="A small sample cross-platform networking library"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.libsdl.org/projects/SDL_net/"
depends=('lib32-sdl')
source=(http://www.libsdl.org/projects/SDL_net/release/SDL_net-$pkgver.tar.gz)
build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	cd "$srcdir/SDL_net-$pkgver"
	./configure --prefix=/usr --disable-static --libdir='/usr/lib32'
	make
}
package() {
	cd "$srcdir/SDL_net-$pkgver"
	make DESTDIR="$pkgdir" install
	rm -rf "$pkgdir/usr/include"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4')
