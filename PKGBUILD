# Maintainer: greg erwin 256 at gmail dot com
pkgname=signal-hound-vsg60
pkgver=1.0.15
pkgrel=1
pkgdesc="Signal generation software for Signal Hound VSG60"
arch=('x86_64')
url="https://signalhound.com/software/vsg60-software/"
license=('custom')
depends=('libusb' 'signal-hound-udev')
source=("$pkgname-$pkgver.zip::https://signalhound.com/download/vsg60a-software-installer_ubuntu-18-04x64/"
        'com.signalhound.vsg60.desktop')
sha1sums=('4f059e35b0445c8fdff2c2586162fe8d17054aac'
          '97dfef8f137a888e47944db9e9dddebc1b302234')

package() {
	DESTDIR='opt/signal-hound/vsg60'
	mkdir -p $pkgdir/$DESTDIR
	mv VSG60* -T $pkgdir/$DESTDIR
	cd $pkgdir/$DESTDIR

	rm setup.sh sh.rules
	
	chmod 755 vsg60
	chmod 755 bin/vsg60

	sed -i "s:INSTALL_DIR:/$DESTDIR:g" $srcdir/com.signalhound.vsg60.desktop
	install -Dm 644 $srcdir/com.signalhound.vsg60.desktop -t $pkgdir/usr/share/applications

	ldconfig -n ./lib
}
