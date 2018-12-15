# Maintainer: Matthias gatto <uso.cosmo.ray@gmail.com>
# Form from original sndio package from : Ivy Foster <code@escondida.tk>
# Reference: PKGBUILD(5)

pkgname=libsndio-61-compat
pkgver=1.3.0
pkgrel=1
pkgdesc='A small audio and MIDI framework part of the OpenBSD project'
arch=(x86_64)
url='http://www.sndio.org'
license=(ISC)

# sndio can be built without libbsd, but there are a bunch of individual
# ISC-licensed files by different authors to extract the licenses from
# if done that way. Licenses are complicated.
depends=(alsa-lib libbsd)

source=("http://www.sndio.org/sndio-$pkgver.tar.gz")
# checksums provided by packager
sha256sums=(bcc33213f02adc71bd0c3543f3b243847e7d27c5243b0b558182bc1b3056e4b1)
# backup=(etc/default/sndiod)

build() {
	cd "sndio-$pkgver"
	./configure --enable-alsa --with-libbsd
	make
}

package() {
	cd "sndio-$pkgver"

	install -D -m 755 libsndio/libsndio.so.6.1 \
		"$pkgdir/usr/lib/libsndio.so.6.1"
}
