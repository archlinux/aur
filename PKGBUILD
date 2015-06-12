# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=mofilereader
pkgver=0.1.2
pkgrel=2
pkgdesc="API that lets you read .mo-Files and use their content just as you would do with GNUs gettext"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mofilereader/"
makedepends=('cmake')
license=('MIT')
source=(http://mofilereader.googlecode.com/files/moFileReader.${pkgver}.zip
http://wiki.rigsofrods.com/images/1/1f/MoFR.patch)
md5sums=('768b2e118c1e845622593e7c4b76777b'
         '94ed75c7e1a8a419099a7ef72025985a')

build() {
  cd $srcdir/src
  patch -p0 < ../MoFR.patch
  cd ../build
  cmake -DCMAKE_BUILD_TYPE=Release -DCOMPILE_DLL=ON .
  make -j2
}

package() {
  mkdir -p $pkgdir/usr/include
  cd $srcdir/
  install -D -m644 lib/libmoFileReader.so $pkgdir/usr/lib/libmoFileReader.so
  install -D -m644 include/* $pkgdir/usr/include/
}
