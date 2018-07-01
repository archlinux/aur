# Maintainer: robertfoster

pkgname=torrential
pkgver=1.0.9
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A simple torrent client for elementary OS"
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=(curl gtk3 libarchive libevent libunity granite openssl miniupnpc)
makedepends=(cmake vala)
source=("$pkgname-$pkgver::git+https://github.com/davidmhewitt/torrential#commit=1b08707354b198d1061260f566cd9f286a5f701c")

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
