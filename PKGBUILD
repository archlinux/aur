# Submitter: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd
pkgver=1.6.0
pkgrel=2
pkgdesc='Share your terminal over the web'
arch=('i686' 'x86_64' 'armv7h')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake' 'vim') # vim needed for its xxd binary
source=("ttyd.service"
	"https://github.com/tsl0922/ttyd/archive/$pkgver/ttyd-$pkgver.tar.gz")
sha512sums=('b6c731444ad78d68464082557a4b7dae857f2b86511810f055d2a4c8e1c7051328cdbcd1f8a43c322a2dd20c20474b483f9fa104785268bafdefb04cce54287d'
            'f713ebfc4b36784a9a66b2ed1c11386c6edb2acfe8030e60f589f0d4325a9c237001d47c0de9938fa3d4c8d58cd8e233ec7fe9760fcda6b9fa5a518a4f4b7c90')

build() {
	cd ttyd-$pkgver
	mkdir build -p && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd ttyd-$pkgver/build
	make DESTDIR="$pkgdir" install

	install -Dm644 -t "$pkgdir"/usr/share/licenses/ttyd ../LICENSE

	# Install SystemD related files
	install -D -m644 ../../ttyd.service   "${pkgdir}/usr/lib/systemd/system/ttyd.service"
}

