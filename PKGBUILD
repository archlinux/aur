# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='cadabra2-git'
pkgver=r701.a17ad42
pkgrel=2
pkgdesc="A computer algebra system (pre-release version) designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
provides=('cadabra2')
conflicts=('cadabra2')
depends=('python2-matplotlib' 'gtkmm3' 'jsoncpp' 'mathjax' 'boost-libs' 'python2-sympy')
makedepends=('cmake' 'gcc' 'boost')
source=("$pkgname::git+https://github.com/kpeeters/cadabra2" "package.patch")
md5sums=('SKIP'
         '7eaf565d2558304a454d2669effa2630')
install=package.install


pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
 cd "${srcdir}/${pkgname}"
 patch -Np1 -i ../package.patch
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
