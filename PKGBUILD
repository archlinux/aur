
pkgname=opendune
_pkgname=OpenDUNE
pkgver=0.8
pkgrel=1
pkgdesc="Open source re-creation of the popular game Dune II"
arch=('i686' 'x86_64')
url="http://opendune.org"
license=('GPL2')
depends=('sdl' 'alsa-lib')
optdepends=('timidity++: midi music support')
provides=('opendune')
source=("https://github.com/OpenDUNE/OpenDUNE/archive/$pkgver.tar.gz")
sha256sums=('fada4127715e4913553f4dbe8b5ac284ee6080377da62e65ae03f1e1d551dfbd')

build() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i "s/flags\=\"\$flags\ \-ansi\ \-pedantic\"/:/" config.lib
  ./configure #--without-pulse
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
	#make DESTDIR="$pkgdir/" install
	mkdir -p $pkgdir/opt/$_pkgname/bin
	mv bin/opendune $pkgdir/opt/$_pkgname/bin
	mv bin/opendune.ini.sample $pkgdir/opt/$_pkgname
	mkdir $pkgdir/opt/$_pkgname/data
}

