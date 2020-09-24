# Maintainer: Juri Vitali <juri@dividebyzero.it>
pkgname=vlc-bittorrent
pkgver=2.11
pkgrel=2
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
makedepends=(boost autoconf-archive)
source=("https://github.com/johang/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('b92cb38b3ed1f4a542786064781cfbdb4200e40001a29434ed1f9f44ff2236d5')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
# Uncomment `--with-tests` to enable tests
	./configure --prefix=/usr \
                    --libdir=/usr/lib/vlc/plugins/bittorrent #\
#	            --with-tests
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
