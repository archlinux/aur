# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-git
pkgver=20160120
pkgrel=1
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API (git version)"
url="http://www.gog.com/en/forum/general/lgogdownloader_gogdownloader_for_linux"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man' 'cmake')
source=('git://github.com/Sude-/lgogdownloader.git')
md5sums=('SKIP')
provides=('lgogdownloader')
conflicts=('lgogdownloader')
_gitname="lgogdownloader"

pkgver() {
	date +"%Y%m%d"
}

prepare() {
	cd $srcdir/${_gitname}

	if [ ! -d "build" ]; then
		mkdir build
	else
		rm -rf build/*
	fi

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

	install -D -m 755 $srcdir/${_gitname}/build/man/${_gitname}.1.gz \
		$pkgdir/usr/share/man/man1/${_gitname}.1.gz
}
