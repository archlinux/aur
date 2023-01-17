# Maintainer: muttleyxd <mateusz[ at ]szychowski.it>
pkgname=trompeloeil-git
pkgver=1288.45772ae
pkgrel=1
pkgdesc="Header only C++14 mocking framework"
arch=('i686' 'x86_64')
url="https://github.com/rollbear/trompeloeil.git"
license=('Boost')
makedepends=('cmake' 'make')
optdepends=('boost' 'catch2' 'criterion' 'cxxtest' 'doctest' 'gtest')
provides=('trompeloeil')
conflicts=('trompeloeil')
source=("$pkgname::git+https://github.com/rollbear/trompeloeil")
md5sums=('SKIP')

pkgver() 
{
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() 
{
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() 
{
  cd "$srcdir/$pkgname"
  install -D -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_1_0.txt"
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}
