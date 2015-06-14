# Maintainer: Jonathan Wiersma <archaur at jonw dot org>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>
pkgname=extcalc
pkgver=0.9.3_1
pkgrel=3
pkgdesc="A multifunctional scientific graphic calculator"
arch=('i686' 'x86_64')
url="http://extcalc-linux.sourceforge.net"
license=('GPL')
depends=('mesa' 'qt4>=4.3')
makedepends=('gcc>=3' 'cmake')
source=("http://downloads.sourceforge.net/$pkgname-linux/$pkgname-${pkgver//_/-}.tar.gz")

build() {
	cd $srcdir/$pkgname-${pkgver/_/-}
	sed -i 's|${QT_LIBRARIES}|${QT_LIBRARIES} ${OPENGL_LIBRARIES}|' CMakeLists.txt
	sed -i "s|FIND_PACKAGE|FIND_PACKAGE(OpenGL REQUIRED)\nFIND_PACKAGE|" CMakeLists.txt
	sed -i 's|/usr/local|/usr|' CMakeLists.txt
	cmake -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package()
{
	cd "$srcdir/$pkgname-${pkgver/_/-}"
	make DESTDIR="$pkgdir" install
}

md5sums=('efe53d36c8f1f1811ab46ed1a6e0e240')
