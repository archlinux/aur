# Contributors:
#   James Tappin       <jtappin at gmail dot com>
#   Rene Hickersberger <public at renehsz dot com>

pkgname=gtk-3-fortran-git
pkgver=r536.6173c1f
pkgrel=1
pkgdesc="A binding of the GTK+ 3.x libraries for Fortran 95/2003"
arch=('i686' 'x86_64')
url="https://github.com/jerryd/gtk-fortran/wiki"
license=('GPL3')
depends=('gtk3' 'plplot')
makedepends=('cmake' 'gcc-fortran' 'git')
provides=('gtk-3-fortran')
conflicts=('gtk-3-fortran')
source=('git+https://github.com/jerryd/gtk-fortran.git#branch=gtk3')
sha256sums=('SKIP')

pkgver() {
  cd gtk-fortran
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gtk-fortran
  # Don't build sketcher, it fails to build
  sed -i '/sketcher/d' CMakeLists.txt
}

build() {
  cd gtk-fortran
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DNO_BUILD_EXAMPLES=y
  make -j1
}

package() {
  cd gtk-fortran
  make DESTDIR="$pkgdir" install
}
