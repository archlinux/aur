# Maintainer: nytpu <alex at nytpu dot com>

_progname=bgm-mpd
pkgname=bgm-mpd-git
pkgver=v1.r1.ga899f18
pkgrel=1
pkgdesc="MPD client to play music with gaps between tracks, like video game background music"
url='https://git.sr.ht/~nytpu/bgm-mpd'
arch=('any')
license=('AGPL-3.0-only')
depends=('libmpdclient')
makedepends=('git')
source=("git+https://git.sr.ht/~nytpu/${_progname}")
sha256sums=('SKIP')
provides=("${_progname}")

pkgver() {
	cd "${srcdir}/${_progname}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_progname}"
	export CFLAGS LDFLAGS
	DESTDIR="${pkgdir}" PREFIX="/usr" ./configure
}

build() {
	cd "${srcdir}/${_progname}"
	make
}

package() {
	cd "${srcdir}/${_progname}"
	make install
}
