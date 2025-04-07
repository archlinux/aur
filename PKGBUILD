pkgname=ranger-cpp-git
pkgver=r1567.2f226e5
pkgrel=1
pkgdesc="A Fast Implementation of Random Forests"
license=('MIT')
arch=('any')
url="https://github.com/imbs-hl/ranger"
depends=('glibc')
makedepends=('cmake')
source=("git+https://github.com/imbs-hl/ranger")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ranger"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build () {
  cd ranger
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -S cpp_version -B build
  cmake --build build
}

package() {
  cd ranger 
  DESTDIR="$pkgdir" cmake --install build
}
