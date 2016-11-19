# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=3.0
pkgrel=1
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl' 'tinyxml2')
makedepends=('help2man' 'cmake')
source=("http://sites.google.com/site/gogdownloader/$pkgname-$pkgver.tar.gz")
sha256sums=('4aeb7535a3e68da19ebdf6e5fa8e6553bb8087099bde660b2c883b9d28693835')

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


