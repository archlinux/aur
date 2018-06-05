# Maintainer: robertfoster

pkgname=torrential
pkgver=1.0.8
pkgrel=2
arch=(i686 x86_64)
pkgdesc="A simple torrent client for elementary OS"
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=(curl gtk3 libarchive libevent libunity granite openssl miniupnpc)
makedepends=(cmake vala)
source=("$pkgname-$pkgver::git+https://github.com/davidmhewitt/torrential#commit=7bd4a1691d60d2c542a0ec05350c28651c710cb2")

prepare() {
	cd $pkgname-$pkgver
	if [ ! -d build ]; then
		mkdir build
	fi
	git submodule update --init --recursive
}

build() {
	cd $pkgname-$pkgver
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd $pkgname-$pkgver
	cd build
	make DESTDIR=$pkgdir install
}

md5sums=('SKIP')
