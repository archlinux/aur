# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('i686' 'x86_64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/4.1.0/INAV-Configurator_linux64_4.1.0.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums_x86_64=('fab3f3cad9c041c3466c84850476f8252f4dab2d02da2dfa93e10f06fabf9aca'
         'SKIP'
         'fc4325798b8d93ab37960e306305c65122dba698265eb749664517f67f2304c5')

source_i686=(https://github.com/iNavFlight/inav-configurator/releases/download/4.1.0/INAV-Configurator_linux32_4.1.0.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums_i686=('568b065d93bdf6faa9d03fadc614c68b980bde27f3e859715b79d4aa1dc8f6ad'
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

	install -Dm644 "$srcdir/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"
	install -Dm644 "$srcdir/inav_icon_128.png" "$pkgdir/opt/inav/inav-configurator/icon/inav_icon_128.png"

	install -d "$pkgdir/usr/bin/"
	ln -s "$pkgdir/opt/inav/inav-configurator/inav-configurator" "$pkgdir/usr/bin/inav-configurator"

	echo "Dont forget to add your user into uucp group \"sudo usermod -aG uucp $USER\" for serial access"
}