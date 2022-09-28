# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname=consolation
pkgver=0.0.9
pkgrel=2
pkgdesc="Libinput-based console pointer support for copy-paste, similar to gpm"
arch=('x86_64')
url="https://salsa.debian.org/consolation-team/consolation"
license=('GPL')
makedepends=('help2man')
depends=('libevdev>=0.9.1' 'libinput>=1.21' 'systemd-libs>=183')
source=("https://deb.debian.org/debian/pool/main/c/consolation/${pkgname}_${pkgver}.orig.tar.xz")
md5sums=('d062066b16411a035217626568c51eed')

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
