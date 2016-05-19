# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-git
pkgver=2.28.r5.g730c1ff
pkgrel=3
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API (git version)"
url="http://www.gog.com/en/forum/general/lgogdownloader_gogdownloader_for_linux"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'boost-libs' 'jsoncpp' 'liboauth' 'rhash' 'htmlcxx' 'tinyxml2') 
makedepends=('help2man' 'cmake' 'git')  
provides=('lgogdownloader')
conflicts=('lgogdownloader')
_gitname="lgogdownloader"
source=('git://github.com/Sude-/lgogdownloader.git')
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/${_gitname}
	git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd $srcdir/${_gitname}

	if [ ! -d "build" ]; then
		mkdir build
	else
		rm -rf build/*
	fi

# Possible options for -DCMAKE_BUILD_TYPE are Release and Debug
# Debug has console spew

	cd build
 	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
}

build() {
	cd $srcdir/${_gitname}/build

	make
}

package() {
	cd $srcdir/${_gitname}/build
	
	make DESTDIR=$pkgdir install
}
