# Maintainer: greg erwin 256 at gmail dot com
pkgname=signal-hound-spike
pkgver=3.9.0
pkgrel=1
pkgdesc="Spectrum analyzer software for Signal Hound BB60, SM200, SM435, and SP145"
arch=('x86_64')
url="https://signalhound.com/spike/"
license=('custom')
depends=('libusb' 'signal-hound-udev')
source=("https://signalhound.com/sigdownloads/Spike/Spike(Ubuntu22.04x64)_3_9_0.zip")
sha1sums=('f7f9455764c1347d2d339bfe3e8b54ff2036367f')

package() {
	DESTDIR='opt/signal-hound/spike'
	mkdir -p $pkgdir/$DESTDIR
	mv "Spike(Ubuntu22.04x64)_3_9_0/" -T $pkgdir/$DESTDIR
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
