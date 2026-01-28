# Maintainer: Juma7C9 « me · dbzero · it »
pkgname=vlc-bittorrent
pkgver=2.16
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
makedepends=(boost autoconf-archive)
source=("https://github.com/johang/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bbecd1e3900112f6df4f54bd04aa0f834de7061ddb9ad4b81d870fb051bc1ccf')

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
