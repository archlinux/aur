# Maintainer:  <aaron.l.france@gmail.com>
pkgname=libzookeeper
pkgver=3.4.11
pkgrel=1
pkgdesc="libzookeeper"
arch=('i686' 'x86_64')
url="https://github.com/apache/zookeeper"
license=('Apache')
makedepends=(apache-ant autoconf automake cppunit)
checkdepends=()
optdepends=()
provides=(libzookeper)
source=(https://github.com/apache/zookeeper/archive/release-$pkgver.tar.gz Use-PKG_CHECK_insteadOf-AM_PATH_CPPUNIT.patch)
md5sums=('c21ab388088edab98cade3f1308d352c' '855b95195ae8bf987f6897ce4d175f07')

build() {
  cd "$srcdir/zookeeper-release-$pkgver"
  ant clean jar
  cd src/c
  ACLOCAL="aclocal -I /usr/share/aclocal" autoreconf -if
  ./configure --prefix=/usr && make
}

package() {
  cd "$srcdir/zookeeper-release-$pkgver/src/c/"

  make DESTDIR="$pkgdir/" install
}

prepare() {
  cd "$srcdir/zookeeper-release-$pkgver/"
  patch -p1 -i ../Use-PKG_CHECK_insteadOf-AM_PATH_CPPUNIT.patch
}

# vim:set ts=2 sw=2 et:
