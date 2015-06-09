# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=pegc
pkgver=705c7a70ba
pkgrel=1
pkgdesc="An experimental toolkit for writing PEG parsers in C"
arch=(i686 x86_64)
url="http://fossil.wanderinghorse.net/repos/pegc/index.cgi/index"
license=('GPL')
makedepends=('fossil')
options=('staticlibs')
source=("shake-n-make.make.patch")
md5sums=('f41271f6677da68283500b5264c00218')

prepare() {
  [ ! -d $pkgname ] && mkdir $pkgname
  pushd .
  if [ ! -f "$srcdir/$pkgname.fossil" ]; then
    fossil clone http://fossil.wanderinghorse.net/repos/$pkgname/index.cgi $srcdir/$pkgname.fossil
    cd $pkgname
    fossil open $srcdir/$pkgname.fossil
  fi
  popd
}

build() {
	cd $pkgname/src
	patch -p0 -i "$srcdir/shake-n-make.make.patch"
	make
}

package() {
	cd $pkgname/src
  install -m755 -d $pkgdir/usr/{include,lib}
  install -m644 $pkgname.h $pkgdir/usr/include
  install -m644 *.a $pkgdir/usr/lib/
}
