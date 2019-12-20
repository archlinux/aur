# Maintainer: Juri Vitali <juri@dividebyzero.it>
pkgname=vlc-bittorrent
pkgver=2.8
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
makedepends=(boost)
source=("https://github.com/johang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9f0d7c17900793db9cf09509b34cddbd4545fb7fa2a048c6cc9665adc9dca809')

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
