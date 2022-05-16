# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.6.0
pkgrel=1
pkgdesc='MIDI file player based on Drumstick'
arch=('x86_64')
url='https://sourceforge.net/projects/dmidiplayer/'
license=('GPL3')
depends=('drumstick' 'uchardet')
makedepends=('cmake' 'qt5-tools' 'pandoc')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('5385dc5ad4273fdaa9f1fdd5f95ed88549a9d957c89eb24e4de80017ee847610e850178c389e4f428f048d7233377845921f0d733d19b25835735cfe4250ab55')

build() {
	cmake -B build \
	      -S $pkgname-$pkgver \
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
