# Maintainer: tembleking <tembleking at gmail dot com>
pkgname=whatsapp-web-desktop
pkgver=2.18.269
pkgrel=1
pkgdesc="WhatsApp Web for desktop"
arch=('i686' 'x86_64')
url="https://web.whatsapp.com"
license=('unknown')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('nodejs-nativefier')
provides=('whatsapp-desktop')
source=('whatsapp-web-desktop.svg'
        'whatsapp-web-desktop.desktop'
        'whatsapp-web-desktop.sh')
md5sums=('c80916a93d3177ce8afd398539d46573'
         'b5b89ccd54a6e2ee7c8dfbaa21b223d5'
         '78a9b5d6119cc5ccbc80df46c0c9d5ef')

build() {
	cd $srcdir

	nativefier web.whatsapp.com \
		--name "whats-app" \
		--disable-context-menu \
		--disable-dev-tools \
		--width 700px \
		--height 700px \
		-i "../$pkgname.svg"

	rm -rf whats-app
	mv whats-app-* WhatsApp
	mv WhatsApp/whats-app WhatsApp/WhatsApp
}

package() {
	install -dm755 "$pkgdir/opt/whatsapp-web"
	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	cp -R "$srcdir/WhatsApp/." "$pkgdir/opt/whatsapp-web/"
	chmod 755 "$pkgdir/opt/whatsapp-web/resources/app"

	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/pixmaps/whatsapp.svg"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

