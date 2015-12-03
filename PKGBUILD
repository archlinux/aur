# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=cvector
pkgver=1.0.3
pkgrel=2
pkgdesc="An ANSI C implementation of dynamic arrays to provide an approximation to the C++ vector class"
arch=('i686' 'x86_64')
url="http://cvector.sourceforge.net/"
depends=('glibc')
license=('LGPL')
source=(http://downloads.sourceforge.net/project/cvector/cvector/CVector-$pkgver/CVector-$pkgver.tar.gz)
md5sums=('9de194c233e1a4a8223b5258a1d689fb')

prepare() {
  cd $srcdir/CVector-$pkgver
  sed -i "s|INSTALL_PREFIX = /usr/local|INSTALL_PREFIX = ${pkgdir}/usr|" ./Makefile
  make clean
}

build() {
  cd $srcdir/CVector-$pkgver
  make all || return 1
}

package() {
  cd $srcdir/CVector-$pkgver
  make install
  # do not install the libtool thing
  rm ${pkgdir}/usr/lib/*.la
}
