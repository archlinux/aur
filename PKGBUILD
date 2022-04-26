# Maintainer: saltedcoffii <55339220+saltedcoffii@users.noreply.github.com>
pkgname=tgs-to-gif-cpp-git
pkgver=0.1.2
pkgrel=2
pkgdesc="Animated stickers for Telegram (*.tgs) to animated GIFs converter, c++ version"
arch=("x86_64" "i386" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/ed-asriyan/tgs-to-gif"
license=('MIT')
depends=('rlottie')
makedepends=('conan' 'cmake')
provides=('tgs-to-gif' 'tgs-to-gif-cpp' 'tgs-to-gif-git')
conflicts=('tgs-to-gif' 'tgs-to-gif-cpp' 'tgs-to-gif-git')
source=("git+https://github.com/ed-asriyan/tgs-to-gif"
				basename.patch)
sha256sums=('SKIP'
						'd5b6f6c734ed8dbc6ffed897e2789d3a6e2a93b5ff3cf85bf6d42298353d1e9f')

build() {
	cd "tgs-to-gif"
	git checkout master-cpp
	patch -Np1 -i ../basename.patch
	conan install . --build
	cmake CMakeLists.txt
	make
}

package() {
	mkdir -p $pkgdir/usr/bin/
	install tgs-to-gif/bin/tgs_to_gif $pkgdir/usr/bin/tgs-to-gif
	ln -srv $pkgdir/usr/bin/tgs-to-gif $pkgdir/usr/bin/tgs2gif
}
