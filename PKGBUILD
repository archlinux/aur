# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('i686' 'x86_64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/7.0.0/INAV-Configurator_linux64_7.0.0.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums_x86_64=('c5cba669948f565ed4058d9e224de09595b6c9a89fade072f6c74fa97a64ebff'
         'SKIP'
         'fc4325798b8d93ab37960e306305c65122dba698265eb749664517f67f2304c5')

source_i686=(https://github.com/iNavFlight/inav-configurator/releases/download/7.0.0/INAV-Configurator_linux32_7.0.0.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums_i686=('6ffc522060cab8c41facbc6dac4f7086aabed4bfe9eea687ef2c92fa5ff99a22'
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