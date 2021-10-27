# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.5.2
pkgrel=1
pkgdesc="MIDI file player based on Drumstick"
arch=('x86_64')
url="https://sourceforge.net/projects/dmidiplayer/"
license=('GPL3')
depends=('drumstick' 'uchardet')
makedepends=('cmake' 'qt5-tools' 'pandoc')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('5407f2535e1ba50b46d99a251bcb9b94cc1906acb3c34eb5f694c0d25e84961403061b94b0f4c0a7a3d0aee0345566350dc07f78afcb4fe1196d017b49bda6f2')

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
