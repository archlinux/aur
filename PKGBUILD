# Maintainer: Ilya Terentyev <bacondropped at gmail dot com>
pkgname=sidplayer
pkgver=4.4
pkgrel=1
pkgdesc='A SID tune replayer'
arch=('i686' 'x86_64')
license=('GPL')
url='https://sidplayer.cebix.net/'
makedepends=('git')
depends=('sdl')
source=(
	"SIDPlayer-$pkgver.tar.gz::http://sidplayer.cebix.net/downloads/SIDPlayer-$pkgver.tar.gz"
	'sid-cpp-narrowing-v4.4.patch'
	'sidplayer.install'
)
sha1sums=(
	'ab6d0650b3469b27e5b2a0e52d0de6ecf1b1e7ae'
	'4b803087bf5b58074f61a9c7c9bc1cda264a784a'
	'143895487c84d801f2aae493bafa0a608d45e4af'
)

prepare() {
	cd "${srcdir}/SIDPlayer-${pkgver}"
	patch -Np1 < ../sid-cpp-narrowing-v4.4.patch
}

build() {
	cd "${srcdir}/SIDPlayer-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	mkdir -p "${pkgdir}/usr/share/sidplayer"
	cd "${srcdir}/SIDPlayer-${pkgver}"
	make DESTDIR="${pkgdir}" install
	cp -r "PSID Demo" "${pkgdir}/usr/share/sidplayer"
}
