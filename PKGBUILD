# Maintainer: Patrick Darwinkel <patrick@darwinkel.net>
pkgname=ogar-git
pkgver=git
pkgrel=2
pkgdesc="A fully functional open source Agar.io server implementation, written in Node.js."
arch=(any)
url="https://github.com/forairan/Ogar"
license=('Apache')
depends=('nodejs' 'npm' 'git' 'systemd')
conflicts=('ogar')
source=('git+https://github.com/forairan/Ogar.git' 'ogar.service')
sha256sums=('SKIP' 'f41103fe9323c16d8677f436a23bcd06e76988172ea82c345366bceff01f6cb8')
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
#	rm -R $pkgdir/usr/share/ogar/bin
	rm $pkgdir/usr/share/ogar/Launch.bat
	rm $pkgdir/usr/share/ogar/src/Start.bat
	rm $pkgdir/usr/share/ogar/.gitignore
	rm $pkgdir/usr/share/ogar/ogar-linux-script.sh
	chmod -R 755 $pkgdir/usr/share/ogar

	install -Dm 644 "ogar.service" "${pkgdir}/usr/lib/systemd/system/ogar.service"

}
