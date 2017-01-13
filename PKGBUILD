# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=3.1
pkgrel=1
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml2' 'htmlcxx' 'curl')
makedepends=('help2man' 'cmake')
source=("http://sites.google.com/site/gogdownloader/$pkgname-$pkgver.tar.gz")
sha256sums=('010d98e23108f605a553efd42ae68abd9ec78db1b2cd18cab89f8fb7e20484c9')

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


