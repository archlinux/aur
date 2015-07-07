# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Vasco Costa <vasco dot costa at geekslot dot com>
pkgname=hoard
_pkgname=Hoard
pkgver=3.10
pkgrel=2
pkgdesc="Fast scalable and memory-efficient memory allocator"
arch=('i686' 'x86_64')
url="http://www.hoard.org/"
license=('GPL')
depends=('gcc')
install=$pkgname.install
source=(https://github.com/emeryberger/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-source.tar.gz)
# gnuwrapper.cpp.patch
md5sums=('b9376c1018c0a582c96858ffb3d01a69')
sha1sums=('7f191a1696456215acfec8483c367e199d18dbc0')
sha256sums=('9776dd824d193937fa5b079f3f16611eaac54876fecff26a6aec0adb029cbca7')
sha512sums=('0f633786175395a9fa113a0366f57345c83127a5a934ba669747c7998db14cd052160b6a9541a7fb464d32e40651884e0d22e75669c534dc7534db4532448e9f')

build() {
#  cp ${srcdir}/gnuwrapper.cpp.patch ${srcdir}/$_unpackaged/src
  cd ${srcdir}/$_pkgname/src
#  patch -p1 < gnuwrapper.cpp.patch
  if [ "$CARCH" = "x86_64" ]; then
    make linux-gcc-x86-64 || return 1
  else
    make linux-gcc-x86 || return 1
  fi
}

package(){
  cd ${srcdir}/$_pkgname/src
  install -D -m755 libhoard.so ${pkgdir}/usr/lib/libhoard.so
}
