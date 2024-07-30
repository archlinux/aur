# Maintainer: Juma7C9 « me · dbzero · it »
pkgname=vlc-bittorrent
pkgver=2.15
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
makedepends=(boost autoconf-archive)
source=("https://github.com/johang/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9958fa65f1ea12b11a2990fd25a0d6546e3bc5f6d9bf221774aa9178b00edaa5')

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
