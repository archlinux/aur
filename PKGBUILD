# Maintainer: Paragoumba <paragoumba at protonmail dot com>
pkgname=open-joystick-display
pkgver=2.8.0
pkgrel=1
pkgdesc="A powerful and easy to use streamer-ready overlay for your joystick or gamepad. Completely free and open source."
arch=("any")
url="https://ojdproject.com/"
license=('custom:Open Joystick Display License')
makedepends=() # TODO ("yarn")
checkdepends=() # TODO
changelog= # TODO "CHANGELOG.md"
source=("$pkgname-$pkgver.tar.gz::https://github.com/KernelZechs/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('20c6af63306b719983b34c487b65c734ee0f6805fd8c2942630ce1c3ec8a0214')

prepare() {
	# TODO WIP 
	cd "$pkgname-$pkgver"
	echo "Prepare $pkgdir $srcdir"
}

build() {
	# TODO WIP
	cd "$pkgname-$pkgver"
	gulp build && gulp rebuild-electron && yarn electron-builder --linux dir
}

package() {
	# TODO WIP
	install -Dm 644 ../"$pkgname".desktop -t "$pkgdir"/usr/share/applications/
	
	cd "$pkgname-$pkgver"
	install -Dm 644 app/icons/icon.png "$pkgdir"/usr/share/pixmaps/open-joystick-display.png
	install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm 755 "$pkgdir"/opt/open-joystick-display/	
	
	cp -r dist/linux-unpacked/* "$pkgdir"/opt/open-joystick-display/

	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
