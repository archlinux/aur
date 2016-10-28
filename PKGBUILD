# Contributor: Thaodan <theodorstormgrade@gmail.com>

pkgname=wargus
pkgver=2.3.0
pkgrel=1
pkgdesc="Warcraft2 Mod that allows you to play Warcraft2 with the Stratagus engine"
arch=("i686" "x86_64")
url="http://wargus.sourceforge.net/"
license=('GPL')
depends=( "stratagus=$pkgver" 'ffmpeg2theora' 'cdparanoia' 'timidity++' 'gtk2' 'tolua++' )
source=("http://launchpad.net/wargus/trunk/${pkgver%%??}/+download/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('46d5d1b64d78efc3ddaab119e4a2ea33')
install=wargus.install

build() {
	cd $srcdir/${pkgname}_${pkgver}.orig
	mkdir -p build
	cd build

	cmake .. -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin
	make 
}

package()  {
        cd $srcdir/${pkgname}_${pkgver}.orig/build
	make  DESTDIR=${pkgdir} install
}

