# Submitter: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd
pkgver=1.6.1
pkgrel=2
pkgdesc='Share your terminal over the web'
arch=('i686' 'x86_64' 'armv7h')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake')
source=("ttyd.service"
	"https://github.com/tsl0922/ttyd/archive/$pkgver/ttyd-$pkgver.tar.gz")
sha512sums=('b6c731444ad78d68464082557a4b7dae857f2b86511810f055d2a4c8e1c7051328cdbcd1f8a43c322a2dd20c20474b483f9fa104785268bafdefb04cce54287d'
            '42fbff479e05dbaab94c8c83180f4ec98b8efe0af2f853e5c9317a84a5a2d46b7fc53308dccfeeea92793f05183a29e29428d2ba62a2a954c1b04335863082b0')

build() {
	cd ttyd-$pkgver
	mkdir -p build && cd build
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

