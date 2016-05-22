# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='cadabra2-git'
pkgver=r721.b39670b
pkgrel=1
pkgdesc="A computer algebra system (pre-release version) designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
provides=('cadabra2')
conflicts=('cadabra2')
depends=('python-matplotlib' 'gtkmm3' 'jsoncpp' 'mathjax' 'boost-libs' 'python-sympy')
makedepends=('cmake' 'boost')
source=("$pkgname::git+https://github.com/kpeeters/cadabra2")
md5sums=('SKIP')
install=package.install


pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_SKIP_RPATH=true -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
