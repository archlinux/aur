# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=2.28
pkgrel=2
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man' 'cmake' 'gcc<=5.3.0')
source=("http://sites.google.com/site/gogdownloader/$pkgname-$pkgver.tar.gz")
sha256sums=('551aa431a1a8d1123fc68dd7504368a7b9f07da5108236a4b91d0d10d67dd16e')
prepare() {
	cd $srcdir/$pkgname-$pkgver

	if [ ! -d "build" ]; then
		mkdir build
	else
		rm -rf build/*
	fi

	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

build() {
	cd $srcdir/$pkgname-$pkgver/build
	make

}

package() {
	cd $srcdir/$pkgname-$pkgver/build
	
	make DESTDIR=$pkgdir install
}


