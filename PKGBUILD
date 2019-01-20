# Maintainer: Juri Vitali <juri@dividebyzero.it>
pkgname=vlc-bittorrent
pkgver=2.6
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
source=("https://github.com/johang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7a218028ed73f39d63f2f7554f9b72ea7227e2b5b64a63d7e225f27718a43998')

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
