pkgname=sound-daemon-phonepi
pkgver=1
pkgrel=1
pkgdesc="Sound control daemon for PhonePi project"
url="https://github.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git")
depends=("qt5-base" "qt5-tools")
source=(git://github.com/PhonePi/phonepi.git)
sha256sums=("SKIP")

build() {
	cd "$srcdir/phonepi/src/btn_sound"
	qmake
	make
}

package() {
	cd "$srcdir/phonepi/src/btn_sound"
	make DESTDIR=$pkgdir install
	install -Dm755 "./btn_sound.service" "$pkgdir/usr/lib/systemd/system/btn_sound.service"
}
