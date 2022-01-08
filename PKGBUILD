# Maintainer: Claudio Ebel <my dot pvt dot emailaddress at gmail dot com>
pkgname=gsl-lite
pkgver=v0.40.0.r1.g4b5e9ab
pkgrel=1
pkgdesc="Guidelines Support Library for C++98, C++11 up"
arch=('any')
url="https://github.com/gsl-lite/gsl-lite"
license=('MIT')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://github.com/gsl-lite/gsl-lite.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p build
}

# header only library, no build step needed
#build() {}

package() {
  cd "$srcdir/$pkgname/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make DESTDIR="$pkgdir" install
  install -D -t $pkgdir/usr/share/licenses/$pkgname/ ../LICENSE
}
