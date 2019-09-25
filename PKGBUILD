# Maintainer: Juri Vitali <juri@dividebyzero.it>
pkgname=vlc-bittorrent
pkgver=2.7
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
makedepends=(boost)
source=("https://github.com/johang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c5ff53ae133cb7f2bd929f8dea972a3cb6e4996f447216567240723dd5d694ce')

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
