pkgname=ogar-git
pkgver=git
pkgrel=4
pkgdesc="An open source Agar.io server implementation, written with Node.js."
arch=(any)
url="https://github.com/OgarProject/Ogar"
license=('Apache')
depends=('nodejs' 'npm' 'git' 'systemd')
source=('git+https://github.com/OgarProject/Ogar' 'ogar.service')
sha256sums=('SKIP' 'f41103fe9323c16d8677f436a23bcd06e76988172ea82c345366bceff01f6cb8')
install="${pkgname}.install"
backup=('usr/share/ogar/gameserver.ini')

pkgver() {
  cd Ogar
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"
	cp -RTf Ogar ogar
	install -dm 755 "$pkgdir/usr/share"
	cp -RTf ogar "$pkgdir/usr/share/ogar"
	cd "$pkgdir/usr/share/ogar"
	rm -Rf .gitignore src/Start.bat ogar-linux-script.sh .git
	cd "$srcdir"
	install -Dm 644 "ogar.service" "${pkgdir}/usr/lib/systemd/system/ogar.service"
	
}
