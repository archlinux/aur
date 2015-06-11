# Maintainer: Patrick Darwinkel <patrick@darwinkel.net>
pkgname=ogar
pkgver=git
pkgrel=1
pkgdesc="A fully functional open source Agar.io server implementation, written in Node.js."
arch=(any)
url="https://github.com/vram4/Ogar"
license=('Apache')
depends=('nodejs' 'npm' 'curl' 'systemd')
source=('ogar.service')
sha1sums=('17e04c0c5872f64ed05bf0f6844ee276210d7bda')
install="${pkgname}.install"
backup=('usr/share/ogar/gameserver.ini')

package() {
	cd $srcdir
	curl -L -O https://github.com/vram4/Ogar/archive/master.zip
	bsdtar -xf master.zip
	mv Ogar-master ogar
	mkdir -p $pkgdir/usr/share
	mv ogar $pkgdir/usr/share/ogar
	rm -R $pkgdir/usr/share/ogar/bin
	rm $pkgdir/usr/share/ogar/Launch.bat
	rm $pkgdir/usr/share/ogar/src/Start.bat
	rm $pkgdir/usr/share/ogar/.gitignore

	install -Dm 644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

}
