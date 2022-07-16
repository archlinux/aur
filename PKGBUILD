# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

pkgname=tgs-to-gif-cpp-git
pkgver=r14.e538087
pkgrel=2
pkgdesc="Animated stickers for Telegram (*.tgs) to animated GIFs converter, c++ version"
arch=("x86_64" "i386" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/ed-asriyan/tgs-to-gif"
license=('MIT')
depends=('rlottie')
makedepends=('conan' 'cmake')
optdepends=('libwebp: WEBP conversion support'
            'gifski: GIF conversion support')
provides=('tgs-to-gif' 'tgs-to-gif-cpp' 'tgs-to-gif-git')
conflicts=('tgs-to-gif' 'tgs-to-gif-cpp' 'tgs-to-gif-git')
source=("git+https://github.com/ed-asriyan/tgs-to-gif")
sha256sums=('SKIP')

build() {
	cd tgs-to-gif
	conan install . --build
	cmake CMakeLists.txt
	make
}

package() {
	mkdir -p $pkgdir/usr/bin/
	install tgs-to-gif/bin/tgs_to_png $pkgdir/usr/bin/tgs_to_png
	install tgs-to-gif/tgs_to_gif.sh $pkgdir/usr/bin/tgs_to_gif.sh
	install tgs-to-gif/tgs_to_webp.sh $pkgdir/usr/bin/tgs_to_webp.sh
	install tgs-to-gif/tgs_to_png.sh $pkgdir/usr/bin/tgs_to_png.sh
	ln -srv $pkgdir/usr/bin/tgs_to_png.sh $pkgdir/usr/bin/tgs2png
	ln -srv $pkgdir/usr/bin/tgs_to_gif.sh $pkgdir/usr/bin/tgs2gif
	ln -srv $pkgdir/usr/bin/tgs_to_webp.sh $pkgdir/usr/bin/tgs2webp
}
