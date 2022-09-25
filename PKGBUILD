# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=statserial
pkgver=1.1
pkgrel=1
pkgdesc="display serial port modem status lines"
arch=(x86_64)
url="http://www.oocities.org/jefftranter@rogers.com/"
license=('GPL')
depends=(ncurses)
source=("http://www.ibiblio.org/pub/Linux/system/serial/$pkgname-$pkgver.tar.gz")
sha512sums=('070ec4b6fb4a432fd406571319d9431d55c6dd43ee9298c1907011038a57dd3efd5def434aeb6884fb195cc90aa961d2ad2ff0567c9c69173e6f4adc0509a805')

build() {
	cd "$pkgname-$pkgver"
	cc ${CFLAGS} ${CPPFLAGS} -o statserial.o -c statserial.c
	cc ${LDFLAGS} -o statserial statserial.o -lcurses
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 statserial "${pkgdir}/usr/bin/statserial"
	install -Dm644 statserial.1 "${pkgdir}/usr/share/man/man1/statserial.1"
}
