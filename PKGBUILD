# Maintainer: Meade Kincke <thedarkula2049@gmail.com>
# Maintainer: Emily Kincke <marleybrush5@gmail.com>
pkgname=brewstillery
pkgver=6.0.2
pkgrel=1
pkgdesc="BrewStillery is a brewer's, vintner's, and distiller's calculator. It has a multitude of great functions, such as calculating ABV, determining carbonation, and total sparge water needed."
url="https://monkeylog.in"
arch=('x86_64')
license=('AGPL3')
depends=('gtk3' 'ttf-roboto')
makedepends=('git' 'cargo')
provides=('brewstillery')
conflicts=('brewstillery')
source=("https://github.com/MonkeyLog/BrewStillery/archive/$pkgver.tar.gz")
md5sums=('adbaef7cf1b71bb2c484635173f3bd84')

build() {
	cd $srcdir/BrewStillery-$pkgver
	cargo build --release
}

package() {
	cd $srcdir/BrewStillery-$pkgver/target/release
	install -Dm755 BrewStillery "$pkgdir/usr/bin/BrewStillery"
	cd $srcdir/BrewStillery-$pkgver/Desktop
	install -Dm644 BrewStillery.desktop "$pkgdir/usr/share/applications/BrewStillery.desktop"
	cd $srcdir/BrewStillery-$pkgver/media
	install -Dm644 BrewStilleryIcon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/BrewStillery.svg"
	install -Dm644 BrewStilleryLogo.png "$pkgdir/usr/share/BrewStillery/BrewStilleryLogo.png"
	cd $srcdir/BrewStillery-$pkgver/media/glassware
	install -dm755 "$pkgdir/usr/share/BrewStillery/glassware/"
	install -Dm644 *.png "$pkgdir/usr/share/BrewStillery/glassware/"
	cd $srcdir/BrewStillery-$pkgver/media/buttons
	install -dm755 "$pkgdir/usr/share/BrewStillery/buttons/"
	install -Dm644 *.png "$pkgdir/usr/share/BrewStillery/buttons/"
}