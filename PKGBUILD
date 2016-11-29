# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=standardese-git
pkgver=0.3
pkgrel=1
pkgdesc="A (work-in-progress) nextgen Doxygen for C++"
arch=('i686' 'x86_64')
url="https://github.com/foonathan/standardese"
license=('MIT')
depends=('clang>=3.7.1' 'boost>=1.55')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/foonathan/standardese.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  mkdir build
  cd build
  cmake -DSTANDARDESE_BUILD_TEST=OFF ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
}
