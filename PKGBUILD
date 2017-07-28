# Maintainer: Hans-Nikolai Viessmann <hv15 @ hw.ac.uk>
pkgname=musikcube-git
pkgver=r1473.05ef7949
pkgrel=1
pkgdesc="a terminal-based cross-platform music player, audio engine, metadata indexer, and server"
arch=('x86_64')
url="https://github.com/clangen/musikcube"
license=('BSD')
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame' 'ncurses' 'boost' 'pulseaudio' 'libpulse' 'alsa-lib' 'curl')
makedepends=('cmake' 'git')
source=('musikcube::git+https://github.com/clangen/musikcube.git'
        'LICENSE.txt')
md5sums=('SKIP'
         'e6df0c6007ed2ff48cf09efb93ea4593')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install

    install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
