# Maintainer: Michael Clark <iiridayn@gmail.com>
pkgname=pico-tts
pkgver=0.1
pkgrel=1
pkgdesc="lib and unix binary for text-to-speech engine from Android"
arch=('x86_64')
url="https://github.com/Iiridayn/pico-tts"
license=('MIT')
makedepends=('binutils' 'git')
provides=('libsvoxpico.so')

prepare() {
	if [ -d "$pkgname" ]; then
		git -C "$pkgname" fetch
	else
		git clone --recurse-submodules "https://github.com/Iiridayn/pico-tts.git"
	fi
	cd "$pkgname"
	git checkout tags/"$pkgver"
	git submodule update
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
