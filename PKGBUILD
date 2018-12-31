# Maintainer: Juri Vitali <juri@dividebyzero.it>
pkgname=vlc-bittorrent
pkgver=2.5
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
source=("https://github.com/johang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('805746b63c4f6d331c660684847f8fa08a3a5baca79f189c4a7cc088a00beaed')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr \
                    --libdir=/usr/lib/vlc/plugins/bittorrent
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
