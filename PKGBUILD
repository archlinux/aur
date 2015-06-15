# Contributor: Ross Melin <rdmelin@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>
# Contributor: libc <primehunter326@gmail.com>
# Contributor: Albert Nguyen <albertbmnguyen@yahoo.com>
# Contributor: Devaev Maxim <mdevaev@gmail.com>


pkgname="mjpg-streamer-pikvm"
pkgver="r65"
pkgrel="4"
pkgdesc="Stream mjpeg frames from a webcam via http (PiKVM edition)"
url="https://github.com/mdevaev/mjpg-streamer"
license="GPL"
arch=("i686" "x86_64" "armv6h" "armv7h")
depends=("libjpeg")
makedepends=("gcc" "cmake")
provides=("mjpeg-streamer")
_commit="b40ca0f89fb23f0a33ed72737d2429820e2e4996"
source=("https://github.com/jacksonliam/mjpg-streamer/archive/$_commit.tar.gz")
md5sums=("0c1708b197ebd9d6f5b96deac8c28d8b")


build() {
	cd "$srcdir/mjpg-streamer-$_commit/mjpg-streamer-experimental"
	# Fuck you, cmake. Fuck you.
	unset CPPFLAGS
	unset LDFLAGS
	unset CXXFLAGS
	unset CHOST
	unset CFLAGS
	make application input_uvc.so input_raspicam.so output_http.so
}

package() {
	cd "$srcdir/mjpg-streamer-$_commit/mjpg-streamer-experimental"
	mkdir -p $pkgdir/usr/share/mjpg-streamer
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/bin
	install *.so $pkgdir/usr/lib/
	install mjpg_streamer $pkgdir/usr/bin/
	install -m 644 CHANGELOG LICENSE README $pkgdir/usr/share/mjpg-streamer/
}
