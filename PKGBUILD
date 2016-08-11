# Contributor: Patrick Bartels <pckbls@gmail.com>

pkgname="sndio"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="Small audio and MIDI framework part of the OpenBSD project"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="http://www.sndio.org/"
license=("MIT")
depends=("alsa-lib")
install=$pkgname.install
backup=("etc/conf.d/sndiod")
source=("http://www.sndio.org/${pkgname}-${pkgver}.tar.gz"
        "sndiod.conf"
		"sndiod.service")
md5sums=('d3483b963c9e4b9c47eca67a4a842ae3'
         'e319eee0a3ccb4d60dd24b7ed1ea34b3'
         '3767e4066491b2ade46b37179285fd80')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --enable-alsa
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 $srcdir/sndiod.conf $pkgdir/etc/conf.d/sndiod
	install -Dm644 $srcdir/sndiod.service $pkgdir/usr/lib/systemd/system/sndiod.service
}

