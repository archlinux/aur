# Maintainer: PhotonX <photon89 at googlemail dot com>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: dopsi
pkgname=glui
pkgver=2.36
pkgrel=6
pkgdesc="A GLUT-based C++ user interface library which provides controls such as buttons, checkboxes, radio buttons, and spinners to OpenGL applications"
depends=('freeglut')
source=('http://downloads.sourceforge.net/glui/glui-2.36.tgz' 'makefile.patch')
url="http://glui.sourceforge.net/"
arch=('i686' 'x86_64')
md5sums=('9e8d506af9a9428dac09e8cd7bda7c1e' 'ad14ce00704ceeb5183d354fd3b2d5c8')
license=('GPL')
options=(staticlibs)

build() {
	cd $srcdir/${pkgname}-${pkgver}/src
	patch -p0 < $srcdir/makefile.patch

	make setup || exit 0
	make lib/libglui.a || exit 0
	make lib/libglui.so.2 || exit 0
}

package() {
	cd $srcdir/${pkgname}-${pkgver}/src
	mkdir -p $pkgdir/usr/lib/
	mkdir -p $pkgdir/usr/include/
	mkdir -p $pkgdir/usr/include/GL/
	mkdir -p $pkgdir/usr/share/doc/glui-2.36/

	cp lib/libglui.a $pkgdir/usr/lib/
	cp lib/libglui.so.2 $pkgdir/usr/lib/
	cp include/GL/glui.h $pkgdir/usr/include/GL/
	cp doc/glui_manual.pdf $pkgdir/usr/share/doc/glui-2.36/
}

