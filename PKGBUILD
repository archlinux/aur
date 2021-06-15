# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor: Milos Kaurin <milos dot kaurin gmail>

pkgname=java-p7zip-binding
pkgver=16.02
_pkgver=16.02-2.01
pkgrel=2
pkgdesc="Java wrapper for 7-Zip C++ library."
arch=('x86_64')
url="https://github.com/borisbrodski/sevenzipjbinding"
license=('LGPL')
depends=('java-runtime>8')
makedepends=('gcc10' 'cmake' 'jdk8-openjdk')
source=(https://github.com/borisbrodski/sevenzipjbinding/archive/Release-$_pkgver.tar.gz)
md5sums=('310ce9e5d70ac42cd9390251cbfed9f1')

build() {
  cd "$srcdir"/sevenzipjbinding-Release-$_pkgver
  export CC=/usr/bin/gcc-10
  export CXX=/usr/bin/g++-10
  cmake -DJAVA_JDK=/usr/lib/jvm/java-8-openjdk .
  make
}

package() {
  cd "$srcdir"/sevenzipjbinding-Release-$_pkgver
  install -Dm755 Linux-amd64/lib7-Zip-JBinding.so "$pkgdir/usr/lib/lib7-Zip-JBinding.so"
  install -Dm644 sevenzipjbinding-Linux-amd64.jar "$pkgdir/usr/share/java/sevenzipjbinding-Linux-amd64.jar"
}

