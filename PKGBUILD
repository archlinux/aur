# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.4.0
pkgrel=3
pkgdesc="MIDI file player based on Drumstick"
arch=('x86_64')
url="https://sourceforge.net/projects/dmidiplayer/"
license=('GPL3')
depends=('drumstick' 'qt5-base' 'uchardet')
makedepends=('cmake' 'qt5-tools' 'pandoc')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('7048e09fe7e3d5fc3190fe8852ca6b41b99e644d3248b87f85fa1878ca3b36913380fee4241ef6eabc58823a0ddb2809bc846c54dcc2eb0a94413b28e9e76130')

prepare() {
	mkdir -p "$pkgname-$pkgver"/build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX="/usr" \
	      -DCMAKE_INSTALL_LIBDIR="lib" \
	      ..
	make
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir" make install

	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
