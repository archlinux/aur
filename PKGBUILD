# Maintainer: Ammann Max <maximilian.ammann@googlemail.com>
pkgname=qwtplot3d-svn
replaces=('qwtplot3d')
conflicts=('qwtplot3d')
pkgver=0.2.7r259
pkgrel=1
pkgdesc="QwtPlot3D is a graphics extension to the Qt GUI application framework. It provides a 3D plotting widget for scientific data and mathematical expressions. It compares to the existing Qwt Project."
arch=('i686' 'x86_64')
url="http://qwtplot3d.sourceforge.net/"
license=('zlib')
makedepends=('gcc' 'make' 'qt5-tools' 'subversion')
depends=('qt5-base' 'qt5-svg' qt5-location qt5-declarative qt5-webchannel qt5-sensors qt5-serialport qt5-webkit qt5-multimedia)
options=('!strip' '!buildflags' 'staticlibs')
source=('qwtplot3d::svn+http://svn.code.sf.net/p/qwtplot3d/code/branches/maintain_0_2_x/#revision=259')
md5sums=('SKIP')

build() {
  cd "${srcdir}/qwtplot3d/qwtplot3d"
  sed -i '/DESTDIR/s/^/#/g' qwtplot3d.pro

  sed -i '/^CONFIG/ s/$/ shared_and_static build_all/' qwtplot3d.pro 

  sed -i '1s/^/#include <GL\/glu.h>\n/' include/qwt3d_openglhelper.h
}

package() {
  cd "${srcdir}/qwtplot3d/qwtplot3d"
  qmake DESTDIR=$pkgdir/usr/lib
  make -j8

  mkdir -p $pkgdir/"usr/include/qwtplot3d" 
  cp "include"/* $pkgdir/"usr/include/qwtplot3d" 
}
