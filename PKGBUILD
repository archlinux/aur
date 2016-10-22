# Contributor: Patrick Bartels <pckbls@gmail.com>

pkgname="sndio"
pkgver="20160922"
pkgrel="1"
pkgdesc="Small audio and MIDI framework part of the OpenBSD project"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="http://www.sndio.org/"
license=("MIT")
depends=("alsa-lib")
install=$pkgname.install
backup=("etc/conf.d/sndiod")
source=("http://www.sndio.org/${pkgname}.tar.gz"
        "sndiod.conf"
		"sndiod.service")
md5sums=('584d0898ae853632502c573a9aae644f'
         'e319eee0a3ccb4d60dd24b7ed1ea34b3'
         '3767e4066491b2ade46b37179285fd80')
build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr --enable-alsa
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 $srcdir/sndiod.conf $pkgdir/etc/conf.d/sndiod
	install -Dm644 $srcdir/sndiod.service $pkgdir/usr/lib/systemd/system/sndiod.service
}

