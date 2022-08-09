# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.7.0
pkgrel=1
pkgdesc='MIDI file player based on Drumstick'
arch=(x86_64)
url='https://dmidiplayer.sourceforge.io/'
license=(GPL3)
depends=(drumstick uchardet)
makedepends=(cmake qt5-tools pandoc)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=(3778a29de8660b21dff7534595afd69d7e8bcac3a6e4b390986b44c19725ff3a956f679742cade53d78b4a8254341d5ac57e61722b2428c3e63ca316e9c7fb7e)
#options=(debug)

build() {
	cmake -B build -S $pkgname-$pkgver \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DBUILD_DOCS=ON \
	      -DUSE_QT=5
	make -C build
}

package() {
	make DESTDIR="$pkgdir" -C build install
	install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
