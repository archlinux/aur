# Maintainer: Joe <kenwood364@gmail.com>
pkgname=bluecherry-client-git
pkgver=2.2.9.r7.gaeda0c2f
pkgrel=1
pkgdesc="Bluecherry Client for use with a bluecherry DVR server."
arch=(x86_64 i686)
url="https://github.com/bluecherrydvr/bluecherry-client.git"
license=('GPL')
depends=(mpv ffmpeg sdl qt5-base)
makedepends=(git qt5-tools)
provides=(bluecherry-client)
conflicts=(bluecherry-client)
source=("git+$url")
md5sums=('SKIP')

pkgver(){
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	./autogen.sh
	./configure
	make
}

package() {
	cd "${pkgname%-git}"
	printf "${pkgdir}"
	install -Dm644 "linux/bluecherry-client.desktop" "${pkgdir}/usr/share/applications/bluecherry-client.desktop"
	install -Dm644 "res/bluecherry-client.png" "${pkgdir}/usr/share/icons/bluecherry-client.png"
	make DESTDIR="${pkgdir}/" install
}
