# Maintainer: greg erwin 256 at gmail dot com
pkgname=signal-hound-spike
pkgver=4.0.3
pkgrel=1
pkgdesc="Spectrum analyzer software for Signal Hound BB60, SM200, SM435, and SP145"
arch=('x86_64')
url="https://signalhound.com/spike/"
license=('custom')
depends=('libusb' 'signal-hound-udev')
source=("https://signalhound.com/sigdownloads/Spike/Spike(Ubuntu22.04x64)_4_0_3.zip")
sha1sums=('9eeaa9144fc366788db88eb22045dc22b669df9e')

package() {
	DESTDIR='opt/signal-hound/spike'
	mkdir -p $pkgdir/$DESTDIR
	mv "Spike(Ubuntu22.04x64)_4_0_3/" -T $pkgdir/$DESTDIR
	cd $pkgdir/$DESTDIR
	
	chmod 755 Spike
	chmod 755 bin/Spike
	
	sed -i "s:INSTALL_DIR:/$DESTDIR:g" com.signalhound.spike.desktop
	install -Dm 644 com.signalhound.spike.desktop -t $pkgdir/usr/share/applications
	install -Dm 644 assets/com.signalhound.spike.png -t $pkgdir/usr/share/icons
	
	rm setup.sh sh.rules com.signalhound.spike.desktop
	
	ldconfig -n ./lib
	ln -sf libspike_ml_api.so.1 ./lib/libspike_ml_api.so
}
