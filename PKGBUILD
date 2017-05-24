# Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgname='sndio-git'
pkgver=1.0.1.r123.f8436a7
pkgrel=1
pkgdesc='A small audio and MIDI framework part of the OpenBSD project'
arch=('i686' 'x86_64')
url='http://www.sndio.org'
license=('MIT')
provides=('sndio')
source=('git+http://caoua.org/git/sndio' '0001-put-cookie-somewhere-better.patch')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd sndio
	git describe | sed 's,release_,,; s,_,.,g; s,-\(.*\)-.,.r\1.,'
}

prepare() {
	cd sndio
	git apply ../0001-put-cookie-somewhere-better.patch
}

build() {
	cd sndio
	./configure --prefix=/usr --enable-alsa
	make
	make -C libsndio libsndio.so
}

package() {
	make -C sndio DESTDIR="$pkgdir/" install
}
