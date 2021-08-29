# Maintainer: rern <rernrern@gmail.com>

pkgname=mpd_oled
pkgver=0.02
pkgrel=1
pkgdesc='OLED Spectrum Display for Raspberry Pi'
url=https://github.com/antiprism/mpd_oled
arch=(i686 x86_64 arm armv7h armv6h aarch64)
license=(MIT)
depends=(alsa-lib fftw i2c-tools)
makedepends=(gcc glibc libtool)
source=(https://github.com/rern/mpd_oled/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=(b512e9b2fca467699ebb6c868bc63d4770c78bc779b3d7be9eafc8194f5bd2ea)

build() {
	export CPPFLAGS="$CPPFLAGS -W -Wall -Wno-psabi"
	cd "${srcdir}/${pkgname}-${pkgver}"
	autoreconf -v -i -I m4 -W all
	./configure
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install-strip
}
