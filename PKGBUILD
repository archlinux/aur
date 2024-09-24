# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=7.1.2
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('i686' 'x86_64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/7.1.2/INAV-Configurator_linux64_7.1.2.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums_x86_64=('f9163c9c8cbb7331081613bdd08598d2a3ceb9ecb7e7de567a541626f5e4f9e6'
         'SKIP'
         'fc4325798b8d93ab37960e306305c65122dba698265eb749664517f67f2304c5')

source_i686=(https://github.com/iNavFlight/inav-configurator/releases/download/7.1.2/INAV-Configurator_linux32_7.1.2.tar.gz
        inav-configurator.desktop
        inav_icon_128.png)

sha256sums_i686=('a44bb2243563648de1ca074b8f8f1f9ce3166808ea2012002d74476c50357235'
         'SKIP'
         'fc4325798b8d93ab37960e306305c65122dba698265eb749664517f67f2304c5')

provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL-3.0-only')
install=inav-configurator.install

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
}