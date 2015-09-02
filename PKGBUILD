# Maintainer: Ainola
# Contributors: Pio, carstene1ns

pkgname=mrrescue
pkgver=1.02c
pkgrel=3
pkgdesc="An arcade styled 2d action game centered around evacuating civilians from burning buildings."
arch=('any')
url="http://tangramgames.dk/games/mrrescue/"
license=('CCPL:by-sa' 'zlib')
depends=('love')
makedepends=('gendesk')
source=("https://github.com/SimonLarsen/mrrescue/releases/download/v$pkgver/$pkgname-$pkgver.love")
md5sums=('85897f04f2e9c3aaded74bf178aeab4c')

prepare() {
	cd $srcdir
	# Generate desktop file
	gendesk -f -n --name "Mr. Rescue" --pkgname "$pkgname" --pkgdesc "$pkgdesc"
	# Generate run script
	echo -e "#!/bin/sh\nexec love /usr/share/$pkgname/$pkgname-$pkgver.love" > $pkgname.sh
}

package() {
	# Copy game and license
	install -Dm0644 "$pkgname-$pkgver.love" "$pkgdir"/usr/share/$pkgname/$pkgname-$pkgver.love
	install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	# Copy desktop file, icon and run script
	install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	install -Dm0644 data/splash.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
	install -Dm0755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
