# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=libitl
pkgver=0.8.0
pkgrel=2
pkgdesc="Islamic Tools and Libraries (ITL)"
url="https://github.com/arabeyes-org/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glibc')
makedepends=('cmake')
source=(https://github.com/arabeyes-org/ITL/archive/v$pkgver.tar.gz)
md5sums=('b1c949e8083ac49f637f5d93d910f2fe')

build() {
  cd $srcdir/ITL-$pkgver 
  sed -i 's/STATIC/SHARED/g' CMakeLists.txt
  sed -i 's/include/include\/itl/g' CMakeLists.txt
  cat >> CMakeLists.txt << EOF
  set_target_properties(itl PROPERTIES VERSION $pkgver)
  set_target_properties(itl PROPERTIES SOVERSION ${pkgver:0:1})
EOF
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
}

package() {
  cd $srcdir/ITL-$pkgver/
  make install || return 1
}
