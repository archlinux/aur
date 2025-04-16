# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname=consolation
pkgver=0.0.10
pkgrel=4
pkgdesc="Libinput-based console pointer support for copy-paste, similar to gpm"
arch=('x86_64')
url="https://salsa.debian.org/consolation-team/consolation"
license=('GPL-2.0-or-later AND MIT')
makedepends=('help2man')
depends=('libevdev>=0.9.1' 'libinput>=1.21' 'systemd-libs>=183')
source=("https://deb.debian.org/debian/pool/main/c/consolation/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('50ecf54a5b3b0e34c10eb9ed07d4de5acebe044bbe8c4caff2574d7bab3aa853')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
	--sbindir=/usr/bin 
	make 
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 consolation.service "${pkgdir}/usr/lib/systemd/system/consolation.service"
	install -D -m644 ChangeLog "${pkgdir}/usr/share/doc/consolation/ChangeLog"
	install -D -m644 README "${pkgdir}/usr/share/doc/consolation/README"
	install -D -m644 LICENSE "${pkgdir}/usr/share/license/consolation/LICENSE"
}
