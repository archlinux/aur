# Maintainer: Patrick Darwinkel <patrick@darwinkel.net>
pkgname=ogar-git
pkgver=git
pkgrel=1
pkgdesc="A fully functional open source Agar.io server implementation, written in Node.js."
arch=(any)
url="https://github.com/vram4/Ogar"
license=('Apache')
depends=('nodejs' 'npm' 'git' 'systemd')
source=('git+https://github.com/vram4/Ogar.git' 'ogar.service')
sha1sums=('SKIP' '17e04c0c5872f64ed05bf0f6844ee276210d7bda')
install="${pkgname}.install"
backup=('usr/share/ogar/gameserver.ini')

pkgver() {
  cd Ogar
  git rev-parse --verify HEAD
}

package() {
	cd $srcdir
	mv Ogar ogar
	mkdir -p $pkgdir/usr/share
	mv ogar $pkgdir/usr/share/ogar
	rm -R $pkgdir/usr/share/ogar/bin
	rm $pkgdir/usr/share/ogar/Launch.bat
	rm $pkgdir/usr/share/ogar/src/Start.bat
	rm $pkgdir/usr/share/ogar/.gitignore
	rm $pkgdir/usr/share/ogar/ogar-linux-script.sh
	chmod -R 755 $pkgdir/usr/share/ogar

	install -Dm 644 "ogar.service" "${pkgdir}/usr/lib/systemd/system/ogar.service"

}
