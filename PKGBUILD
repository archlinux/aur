# Maintainer: robertfoster

pkgname=torrential
pkgver=1.1.0
pkgrel=2
arch=(i686 x86_64)
pkgdesc="A simple torrent client for elementary OS"
url="https://github.com/davidmhewitt/torrential"
license=(GPL2)
depends=('curl' 'granite' 'gtk3' 'libarchive' 'libevent' 'libnatpmp' 'libunity' 'miniupnpc' 'openssl')
makedepends=('cmake' 'vala')
source=("$pkgname-$pkgver::git+https://github.com/davidmhewitt/torrential#commit=70574259eaf41300a65338c6648fb05cb343b594")

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
