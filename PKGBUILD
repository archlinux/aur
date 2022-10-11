# Maintainer: Juri Vitali <juri@dividebyzero.it>
pkgname=vlc-bittorrent
pkgver=2.14
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
makedepends=(boost autoconf-archive)
source=("https://github.com/johang/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bbee28e1864aabac0b8b6c2dc195708446daf74f4fc35bdcf653b3322bfdd6f8')

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
