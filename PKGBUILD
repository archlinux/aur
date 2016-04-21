# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=unittest-cpp-git
pkgver=v1.4.r210.g90357e2
pkgrel=1
pkgdesc="Lightweight unit testing framework for C++"
arch=('i686' 'x86_64')
url="https://github.com/unittest-cpp/unittest-cpp"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'make')
source=("$pkgname"::'git+https://github.com/unittest-cpp/unittest-cpp.git')
md5sums=('SKIP')
conflicts=('unittestpp')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/builds"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname/builds"
  make DESTDIR=$pkgdir install
	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
