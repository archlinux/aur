# Maintainer: Daniel Reibl <janos.daniel.reibl@pm.me>
pkgname=firecapture
pkgver=2.6
pkgrel=1
pkgdesc="The leading planetary capture tool"
arch=('x86_64')
url="http://www.firecapture.de"
license=('custom:firecapture')
depends=('libusb')
source=("local://FireCapture_v${pkgver}.tar.gz")
md5sums=('028ec7767a2f9dab092d4da48c4cb9d2')

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
	
	# License
	install -Dm644 "$pkgdir/opt/FireCapture_v${pkgver}/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
