# Contributer: SolarAquarion (Shlomo Choina  at gmail dot com)

pkgname=rkward-frameworks-git
pkgver=v0.7.0b.r335.g7801fec6
pkgrel=1
pkgdesc="An Easy to use, transparent frontend to the R-language (kf5 frameworks-edition)"
arch=('i686' 'x86_64')
url="https://rkward.kde.org/"
license=('GPL')
depends=('qt5-base' 'r' 'docbook-xml' 'kxmlgui' 'kcodecs' 'kdewebkit')
makedepends=('cmake' 'docbook-xsl' 'git' 'extra-cmake-modules' 'kdoctools')
provides=('rkward')
conflicts=('rkward-git' 'rkward')
source=(git+https://anongit.kde.org/rkward.git#branch=master)

pkgver(){
 cd $srcdir/rkward
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
 }
build() {
cd $srcdir/rkward
cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE:STRING="RelWithDebInfo" \
  -DCMAKE_INSTALL_LIBDIR=lib \
      -DR_LIBDIR=/usr/lib/R/library
make
}

package(){
	cd $srcdir/rkward
	make DESTDIR="$pkgdir" install

	 rm $pkgdir/usr/share/org.kde.syntax-highlighting/syntax/r.xml
}
md5sums=('SKIP')
