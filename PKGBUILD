# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=7.0.1
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64')
url="https://github.com/iNavFlight/inav-configurator"

source=(https://github.com/iNavFlight/inav-configurator/releases/download/7.0.1/INAV-Configurator_linux64_7.0.1.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums=('af2776a2391fa074badbef01af50cc3050aed0ae690510959fcadc01b205fa88'
         'SKIP'
         'fc4325798b8d93ab37960e306305c65122dba698265eb749664517f67f2304c5')

provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL3')

package() {
	mkdir -p "$pkgdir/opt/inav"
	mkdir -p "$pkgdir/usr/bin"
	
	cp -dpr --no-preserve=ownership "$srcdir/INAV Configurator" "$pkgdir/opt/inav/inav-configurator"
	chmod +x "$pkgdir/opt/inav/inav-configurator/inav-configurator"
	chmod +x "$pkgdir/opt/inav/inav-configurator/chrome_crashpad_handler"

	install -Dm644 "$srcdir/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"
	install -Dm644 "$srcdir/inav_icon_128.png" "$pkgdir/opt/inav/inav-configurator/icon/inav_icon_128.png"

	install -d "$pkgdir/usr/bin/"
	ln -s "/opt/inav/inav-configurator/inav-configurator" "$pkgdir/usr/bin/inav-configurator"

	echo "Dont forget to add your user into uucp group \"sudo usermod -aG uucp $USER\" for serial access"
}