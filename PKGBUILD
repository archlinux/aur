# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.5.1
pkgrel=1
pkgdesc="MIDI file player based on Drumstick"
arch=('x86_64')
url="https://sourceforge.net/projects/dmidiplayer/"
license=('GPL3')
depends=('drumstick' 'uchardet')
makedepends=('cmake' 'qt5-tools' 'pandoc')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('d2d00eaf787bbb390366eea7aaa0c956487e9a96774fc7a1704a53243fc0911e88f66314524bc82a47b7af4a4e1a771969f07d87fdd63b6a3388f10e2aae9885')

build() {
	cmake -B "$pkgname-$pkgver/build" \
	      -S "$pkgname-$pkgver" \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib
	make -C "$pkgname-$pkgver/build"
}

package() {
	make DESTDIR="$pkgdir" -C "$pkgname-$pkgver/build" install
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
