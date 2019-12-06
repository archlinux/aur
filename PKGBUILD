# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('i686' 'x86_64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/2.3.2/INAV-Configurator_linux64_2.3.2.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

md5sums_x86_64=('7f7ee96db99167c2111162039d839bcf'
         'SKIP'
         '2c94429c7b2fc0cc78ead5d840f3dd57')

source_i686=(https://github.com/iNavFlight/inav-configurator/releases/download/2.3.2/INAV-Configurator_linux32_2.3.2.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

md5sums_i686=('02885343401d22082e373209f614583b'
         'SKIP'
         '2c94429c7b2fc0cc78ead5d840f3dd57')

provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL3')

package() {
	mkdir -p "$pkgdir/opt/inav"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"
	cp -dpr --no-preserve=ownership "$srcdir/INAV Configurator" "$pkgdir/opt/inav/inav-configurator"
	install -Dm644 "$srcdir/inav_icon_128.png" "$pkgdir/opt/inav/inav-configurator/icon/inav_icon_128.png"
	chmod +x "$pkgdir/opt/inav/inav-configurator/inav-configurator"
	ln -s "$pkgdir/opt/inav/inav-configurator/inav-configurator" "$pkgdir/usr/bin/inav-configurator"

	echo 'Dont forget to add your user into uucp group "sudo usermod -aG uucp YOUR_USERNAME" for serial access'
}