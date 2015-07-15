
pkgname=boombox
pkgver=0.4.4
pkgrel=1
pkgdesc="BoomBox is an KDE4-audio player with built-in database for easy browsing of local music files"
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php/BoomBox?content=12964"
license=('GPL2')
depends=('kdelibs>=4.3' 'kdebase-runtime' 'qt4' 'phonon>=4' 'kdelibs>=4')
makedepends=('automoc4' 'cmake')
source=("https://opendesktop.org/CONTENT/content-files/12964-${pkgname}-${pkgver}.tar.gz")
md5sums=('00149aa097444726280bf5874de69e80')
_buildir=$srcdir/${pkgname}-${pkgver}/build

build() {
cd $srcdir/${pkgname}-${pkgver}

if [ -d "$_buildir" ]; then
		msg 'Cleaning previous build...'
		rm -rf "$_buildir"
	fi
#run cmake manually to set the correct CMAKE_INSTALL_PREFIX
mkdir build
cd build
cmake -DQT_QMAKE_EXECUTABLE=qmake4 -DCMAKE_INSTALL_PREFIX=/usr ..

make || return 1

cd $srcdir/${pkgname}-${pkgver}/build
make DESTDIR=$pkgdir install/strip || return 1
#install -D -m644 $srcdir/kfritz/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
