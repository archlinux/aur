# Maintainer: rern <rernrern@gmail.com>

pkgname=audio_spectrum_oled
pkgver=0.02
pkgrel=1
pkgdesc='Audio spectrum OLED for Raspberry Pi'
url=https://github.com/rern/audio_spectrum_oled
arch=(armv6h armv7h aarch64)
license=(MIT)
depends=(alsa-lib fftw i2c-tools)
makedepends=(glibc)
source=(https://github.com/rern/audio_spectrum_oled/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(SKIP)

build() {
	export CPPFLAGS="-W -Wall -Wno-psabi"
	export CFLAGS=""
	export CXXFLAGS=""
	export LDFLAGS=""
	export DEBUG_CFLAGS=""
	export DEBUG_CXXFLAGS=""
	cd $srcdir/$pkgname-$pkgver
	autoreconf -v -i -I m4 -W all
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install-strip
}
