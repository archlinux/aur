# Submitter: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd
pkgver=1.5.2
pkgrel=1
pkgdesc='Share your terminal over the web'
arch=('i686' 'x86_64' 'armv7h')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake' 'vim') # vim needed for its xxd binary
source=("https://github.com/tsl0922/ttyd/archive/$pkgver/ttyd-$pkgver.tar.gz")
sha512sums=('a1b2931fed58d338fc73b531afe7ae097b30e84d761137068207d0ebd13dd19a330d9d2ec919c0436a9244d2cbfb8e42f1f4bcf9a095fb04934defd08ba78203')

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
}

