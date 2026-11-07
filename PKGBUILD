# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: MGislv <mgislv at ceppo dot xyz>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=dmidiplayer
pkgver=1.8.0
pkgrel=1
pkgdesc='MIDI file player based on Drumstick'
arch=(x86_64)
url='https://dmidiplayer.sourceforge.io/'
license=('GPL-3.0-or-later')
depends=(drumstick glibc hicolor-icon-theme kdsingleapplication libgcc libstdc++ uchardet qt6-base qt6-5compat)
makedepends=(cmake qt6-tools pandoc)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('a0571a0aa382c4fcc4a16d709848ea28351713230d0f982ccb1154067fa82d5d4d265c5d55073939755687df297da07b6fd65279f7e08b6bd314fa8cc9c9b3aa')
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
