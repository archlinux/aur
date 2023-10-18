# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dmidiplayer
pkgver=1.7.3
pkgrel=1
pkgdesc='MIDI file player based on Drumstick'
arch=(x86_64)
url='https://dmidiplayer.sourceforge.io/'
license=(GPL3)
depends=(hicolor-icon-theme drumstick uchardet qt6-base qt6-5compat)
makedepends=(cmake qt6-tools pandoc)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('6903459f091897e2cb6b336eefe879f5eab173077070f6692056d705d180c8ede4a57c36ffcff3f47a3bac56e12262261115bcfb5ff29043ae10bda6811c8edc')
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
