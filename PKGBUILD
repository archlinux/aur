# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=fifechan-git
pkgver=0.1.4.r56.ga58eff3
pkgrel=1
pkgdesc="Fifechan is a C++ GUI library designed for
games. It comes with a standard set of 'widgets'."
arch=('i686' 'x86_64')
url="http://fifengine.github.io/fifechan/"
license=('(L)GPL')
depends=('sdl2_image' 'allegro4' 'libgl' 'glut')
makedepends=('git' 'cmake' 'make')
source=("$pkgname"::'git+https://github.com/fifengine/fifechan.git')
md5sums=('SKIP')
conflicts=("${pkgname/-git}")
provides=("${pkgname/-git}")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR=$pkgdir install
}
