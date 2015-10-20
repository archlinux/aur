
pkgname='solvespace-git'
pkgver=r581.0159a87
pkgrel=1
pkgdesc="SOLVESPACE is a parametric 3d CAD program."
arch=('i686' 'x86_64')
url='http://solvespace.com/'
license=('GPL3')
depends=('fltk>=1.3.0' 'libpng')
makedepends=('git' 'cmake')
source=('solvespace-git::git+https://github.com/jwesthues/solvespace.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  #git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}

