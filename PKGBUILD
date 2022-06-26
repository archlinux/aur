# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('i686' 'x86_64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/5.0.0/INAV-Configurator_linux64_5.0.0.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums_x86_64=('977dd69a33d0d600bb408b5610fcf0d9a0ade53db8526b67fb7583866df6847b'
         'SKIP'
         'fc4325798b8d93ab37960e306305c65122dba698265eb749664517f67f2304c5')

source_i686=(https://github.com/iNavFlight/inav-configurator/releases/download/5.0.0/INAV-Configurator_linux32_5.0.0.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums_i686=('bbb7b6c3f7835ae7d4678208c646a6502f114e2a7197ba152dfaa4754fa7aaaa'
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