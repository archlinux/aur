# Contributor: James Tappin <jtappin at gmail dot com>

pkgname=gtk-2-fortran-git
pkgver=r344.0603604
pkgrel=1
pkgdesc="A binding of the GTK+ 2.x libraries for Fortran 95/2003"
arch=('i686' 'x86_64')
url="https://github.com/jerryd/gtk-fortran/wiki"
license=('GPL3')
depends=('gtk2')
makedepends=('cmake' 'gcc-fortran' 'git')
provides=('gtk-2-fortran')
conflicts=('gtk-2-fortran')
source=('git+https://github.com/jerryd/gtk-fortran.git')
sha256sums=('SKIP')

pkgver() {
  cd gtk-fortran
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
