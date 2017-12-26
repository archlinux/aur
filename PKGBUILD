# Maintainer: tembleking <tembleking at gmail dot com>
pkgname=whatsapp-web-desktop
pkgver=2.17.442
pkgrel=1
pkgdesc="WhatsApp Web for desktop"
arch=('i686' 'x86_64')
url="https://web.whatsapp.com"
license=('unknown')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
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

md5sums=('30ddc7f3e4c4acf46e698909fc8c37b6'
         'b5b89ccd54a6e2ee7c8dfbaa21b223d5'
         '78a9b5d6119cc5ccbc80df46c0c9d5ef')
sha1sums=('47a4d26ed68125e77e7519c2a6c484d98b058ee2'
          'eca6674f60349b59870ec098a7463258bc49ce8d'
          'bff4262d17d6d13e7c5a0bea87960ebea3fc6189')
sha256sums=('bf127917f50f8a4e4c9f217c7227cc0fe07783b186ae15d747f950f67ed9180d'
            'd08d57702dfcab2d3b37d7f3ef9a59955fe2432063fe5b6d91df999af609754b'
            'a3cb0c1c2f6f9fd574cdfc7e08814c3f7908bc4543ace8f3427d4636ddba9c29')
sha512sums=('8e0c4742be68c7122eeb43c3b7318ceb3198f1a493798af51e27d11e92dea8f9dacf3a7ca39223da9ec017a6f476f3066cf62df7e2c3baacf72fb13d827c3706'
            'a1c392b8a7a7045c3f955384be1eefb0ce51d781b656223ccbaffaeb939ba1fbebf4c4085fbc03f52bc24743208455cedc8f4e5b1d10e3885c150082bb585191'
            '7c39adb302df5fbf5a222fd2ad623d348db0c6240069215f11547e072b96e65e363db5bd93d5a25075eab97c15567e89a3825d9b73fe9425e6176032e049c8a0')
