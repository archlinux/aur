# Maintainer: Daniel Reibl <janos.daniel.reibl@pm.me>
pkgname=firecapture
pkgver=2.7
pkgrel=1
pkgdesc="The leading planetary capture tool"
arch=('x86_64')
url="http://www.firecapture.de"
license=('custom:firecapture')
depends=('libusb')
source=("FireCapture_v${pkgver}.tar.gz::http://www.firecapture.de/download.php?file=FireCapture_v${pkgver}.tar.gz")
md5sums=('a7b63e93aa9bd0148e7d1dd8fb5bfd7b')

prepare() {
	ar p "FireCapture_v${pkgver}.deb" data.tar.xz > data.tar.xz
}

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 755 "$pkgdir/opt"
	chmod 755 "$pkgdir/usr"
	chmod 755 "$pkgdir/usr/share"
	chmod 755 "$pkgdir/usr/share/applications"
	install -Dm644 asi.rules "$pkgdir/usr/lib/udev/rules.d/asi.rules"
	install -Dm644 85-qhyccd.rules "$pkgdir/usr/lib/udev/rules.d/85-qhyccd.rules"
	install -Dm644 player_one_astronomy.rules "$pkgdir/usr/lib/udev/rules.d/player_one_astronomy.rules"
	
	# License
	install -Dm644 "$pkgdir/opt/FireCapture_v${pkgver}/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
