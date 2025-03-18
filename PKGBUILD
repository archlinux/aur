# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.7.5
pkgrel=1
pkgdesc='MIDI file player based on Drumstick'
arch=(x86_64)
url='https://dmidiplayer.sourceforge.io/'
license=('GPL-3.0-or-later')
depends=(hicolor-icon-theme drumstick uchardet qt6-base qt6-5compat)
makedepends=(cmake qt6-tools pandoc)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('553b9373a9006066b720e64a0c23e3084f63d187fde17239423f2ed2bb920c223f5680eeb4746a746993edccfabda4496ec6108a4a76b3fb32c1d46200062e43')
#options=(debug)

build() {
	cmake -B build -S $pkgname-$pkgver \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DBUILD_DOCS=ON
	make -C build
}

package() {
	make DESTDIR="$pkgdir" -C build install
	install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 $pkgname-$pkgver/{ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
