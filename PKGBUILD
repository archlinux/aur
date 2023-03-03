# Maintainer: greg erwin 256 at gmail dot com
pkgname=signal-hound-spike
pkgver=3.8.9
pkgrel=1
pkgdesc="Spectrum analyzer software for Signal Hound BB60, SM200, and SM435"
arch=('x86_64')
url="https://signalhound.com/spike/"
license=('custom')
depends=('libusb' 'signal-hound-udev')
source=("$pkgname-$pkgver.zip::https://signalhound.com/download/spike-64-bit-linux/")
sha1sums=('75550032f78520232eb0ee2394ce3ac7bba4fd36')

package() {
	DESTDIR='opt/signal-hound/spike'
	mkdir -p $pkgdir/$DESTDIR
	mv Spike* -T $pkgdir/$DESTDIR
	cd $pkgdir/$DESTDIR

	rm setup.sh sh.rules
	
	chmod 755 Spike
	chmod 755 bin/Spike
	
	sed -i "s:INSTALL_DIR:/$DESTDIR:g" com.signalhound.spike.desktop
	install -Dm 644 com.signalhound.spike.desktop -t $pkgdir/usr/share/applications
	install -Dm 644 assets/com.signalhound.spike.png -t $pkgdir/usr/share/icons
	
	ldconfig -n ./lib
	ln -sf libspike_ml_api.so.1 ./lib/libspike_ml_api.so
}
