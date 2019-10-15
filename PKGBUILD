# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname=consolation
pkgver=0.0.7
pkgrel=1
pkgdesc="Libinput-based console pointer support for copy-paste, similar to gpm"
arch=('x86_64')
url="https://salsa.debian.org/consolation-team/consolation"
license=('GPL')
depends=('libevdev>=0.9.1' 'libinput>=1.5.0' 'systemd>=183' 'help2man')
source=("https://deb.debian.org/debian/pool/main/c/consolation/${pkgname}_${pkgver}.orig.tar.xz")
md5sums=('5ac2520190ec74ec9170b7a3395b264f')

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
}
