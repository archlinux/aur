# Maintainer: flops <flopss at gmail dot com>
pkgname=glip-desktop-electron
pkgver=1.0
pkgrel=1
pkgdesc="Glip electron wrapper"
arch=('i686' 'x86_64')
url="https://app.glip.com/"
license=('unknown')
makedepends=('nodejs')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
provides=('glip-desktop')
sha512sums=('e09a7c214d7daff96496be8c8dbf6ba5e6b05690c4e4bf681e4d1f5b234fd1f273906e9e3359341df8ce71babd44bee5b05dcac7a81389785a01e917e23eb24a'
		'1f6026b47be5f2442cbdfdb3c0a7df43f4d0611194a77bcf28e09efa295d4d31fd79f616a8843332d898b739874a4cdb78d5d05ca0c3db5fa8d75864fce126ef'
		'7194cfd852ce4a12af392bee8a18d99d5d99154674b00b4cd1bf414c380f97e6b0cb680afc4e4043d1877d5a9c52f8b3c397c882a4563997a8c399012f8b6a38'
		'8b931ea096c6acf846a63aa8ed80a86992382c2c750683fad253300ac325eefb5f8a3d74750ddd0683098cd43d5eb1f2ad850c5f1a0bfee0cdaea4393943a0c6'
		'9bc11a4786c9dbc88620e62f07b861e00280098037924af05b589c53cddb170e075f79b825aad006c612be5e94637b10c08993b78518f94ef3178bb66f080cc1')
source=('package.json'
		'package-lock.json'
		'glip-desktop.png'
		'glip-desktop.desktop'
		'glip-desktop.sh')

build() {
	cd $srcdir

	npm install
	npm start
}

package() {
	install -dm755 "$pkgdir/opt/glip-desktop"
	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	cp -R "$srcdir/glip-linux-x64/." "$pkgdir/opt/glip-desktop/"
	chmod 755 "$pkgdir/opt/glip-desktop/resources/app"

	install -Dm755 "$srcdir/glip-desktop.desktop" "$pkgdir/usr/share/applications/glip-desktop.desktop"
	install -Dm755 "$srcdir/glip-desktop.png" "$pkgdir/usr/share/pixmaps/glip-desktop.png"
	install -Dm755 "$srcdir/glip-desktop.sh" "$pkgdir/usr/bin/glip-desktop"
}

