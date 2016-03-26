# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=2.27
pkgrel=4
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API"
url="https://sites.google.com/site/gogdownloader/"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man' 'cmake')
source=("http://sites.google.com/site/gogdownloader/$pkgname-$pkgver.tar.gz" "fix-jsoncpp.patch::https://github.com/Sude-/lgogdownloader/commit/519cb78d38be04a3af79784b5326e21651ced6e1.patch")
sha256sums=('065132d1079322fa60de8d319ef0fc0a15efbd340f4a02b5b2df21be27d3aff1'
            'b16b3f1d3743567e1d7c241d3074d5e36e40e6fb9b47b666b9d47e63a0f1468d')

prepare() {
	cd $srcdir/$pkgname-$pkgver

	if [ ! -d "build" ]; then
		mkdir build
	else
		rm -rf build/*
	fi

        patch -p1 <../fix-jsoncpp.patch

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


