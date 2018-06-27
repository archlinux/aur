# Contributor: Ross Melin <rdmelin@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>
# Contributor: libc <primehunter326@gmail.com>
# Contributor: Albert Nguyen <albertbmnguyen@yahoo.com>
# Contributor: Maxim Devaev <mdevaev@gmail.com>


pkgname="mjpg-streamer-pikvm"
pkgver="r66"
pkgrel="1"
pkgdesc="Stream mjpeg frames from a webcam via http (PiKVM edition)"
url="https://github.com/mdevaev/mjpg-streamer"
license=("GPL")
arch=("i686" "x86_64" "armv6h" "armv7h")
depends=("libjpeg")
makedepends=("gcc" "cmake")
provides=("mjpeg-streamer")
_commit="821c330ea6bbb5fbed98d48e00aac156e923161b"
source=("https://github.com/jacksonliam/mjpg-streamer/archive/$_commit.tar.gz")
md5sums=("48ab94f86622f92b5663d48b56830dc9")


build() {
	cd "$srcdir/mjpg-streamer-$_commit/mjpg-streamer-experimental"
	# Fuck you, cmake. Fuck you.
	unset CPPFLAGS
	unset LDFLAGS
	unset CXXFLAGS
	unset CHOST
	unset CFLAGS
#	make
    [ -d _build ] || mkdir _build
    [ -f _build/Makefile ] || (cd _build && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=$(CMAKE_BUILD_TYPE) ..)
    make -C _build
    cp _build/mjpg_streamer .
    find _build -name "*.so" -type f -exec cp {} . \;
}

package() {
	cd "$srcdir/mjpg-streamer-$_commit/mjpg-streamer-experimental"
	make DESTDIR=$pkgdir install
#	mkdir -p $pkgdir/usr/share/mjpg-streamer
#	mkdir -p $pkgdir/usr/lib
#	mkdir -p $pkgdir/usr/bin
#	install *.so $pkgdir/usr/lib/
#	install mjpg_streamer $pkgdir/usr/bin/
#	install -m 644 CHANGELOG LICENSE README $pkgdir/usr/share/mjpg-streamer/
}
