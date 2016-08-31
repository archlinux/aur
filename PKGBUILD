# Maintainer: tembleking <tembleking at gmail dot com>
pkgname=whatsapp-web-desktop
pkgver=2.16.225
pkgrel=1
pkgdesc="WhatsApp Web for desktop"
arch=('i686' 'x86_64')
url="https://web.whatsapp.com"
license=('unknown')
makedepends=('nodejs-nativefier')
provides=('whatsapp-desktop')
source=('whatsapp-web-desktop.png'
        'whatsapp-web-desktop.desktop'
	'whatsapp-web-desktop.sh')

build() {
	cd $srcdir

	nativefier web.whatsapp.com \
		--name "whats-app" \
		--disable-context-menu \
		--disable-dev-tools \
		--width 700px \
		--height 700px \
		-i "../$pkgname.png"

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
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/whatsapp.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

sha512sums=('8e0c4742be68c7122eeb43c3b7318ceb3198f1a493798af51e27d11e92dea8f9dacf3a7ca39223da9ec017a6f476f3066cf62df7e2c3baacf72fb13d827c3706'
            'a1c392b8a7a7045c3f955384be1eefb0ce51d781b656223ccbaffaeb939ba1fbebf4c4085fbc03f52bc24743208455cedc8f4e5b1d10e3885c150082bb585191'
            '7c39adb302df5fbf5a222fd2ad623d348db0c6240069215f11547e072b96e65e363db5bd93d5a25075eab97c15567e89a3825d9b73fe9425e6176032e049c8a0')
