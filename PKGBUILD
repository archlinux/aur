# Maintainer: saltedcoffii <55339220+saltedcoffii@users.noreply.github.com>
pkgname=tgs-to-gif-cpp-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Animated stickers for Telegram (*.tgs) to animated GIFs converter, c++ version"
arch=("x86_64" "i386" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/ed-asriyan/tgs-to-gif"
license=('MIT')
depends=('rlottie-tdesktop')
# The package 'rlottie-git' also works but I don't know the syntax to allow the user choice. Please help patch this.
makedepends=('conan' 'cmake')
source=("git+https://github.com/ed-asriyan/tgs-to-gif")
md5sums=("SKIP")

build() {
	cd "tgs-to-gif"
	git checkout master-cpp
	conan install . --build
	cmake CMakeLists.txt
	make
}

package() {
	mkdir -p $pkgdir/usr/bin/
	install tgs-to-gif/bin/tgs_to_gif $pkgdir/usr/bin/tgs-to-gif
	ln -s $pkgdir/usr/bin/tgs-to-gif $pkgdir/usr/bin/tgs2gif
}
