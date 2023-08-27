# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.7.2
pkgrel=1
pkgdesc='MIDI file player based on Drumstick'
arch=(x86_64)
url='https://dmidiplayer.sourceforge.io/'
license=(GPL3)
depends=(hicolor-icon-theme drumstick uchardet qt6-base qt6-5compat)
makedepends=(cmake qt6-tools pandoc)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('c102f1925affe7f221e1fdff807e688e64c76464c6141a48ff61c5d1bda9072a8d81f0bf350de3eb907b80b4efafb4920269037bd754365a4875945490eed8a1')
#options=(debug)

build() {
	cmake -B build -S $pkgname-$pkgver \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DBUILD_DOCS=ON \
	      -DUSE_QT=6
	make -C build
}

package() {
	make DESTDIR="$pkgdir" -C build install
	install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 $pkgname-$pkgver/{ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
