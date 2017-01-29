# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='cadabra2'
pkgver=2.1.2
pkgrel=2
pkgdesc="A computer algebra system designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.science/"
license=('GPL')
conflicts=('cadabra2-git')
depends=('python-matplotlib' 'gtkmm3' 'jsoncpp' 'mathjax' 'boost-libs' 'python-sympy' 'texlive-core')
makedepends=('cmake' 'boost')
source=("$pkgname::git+https://github.com/kpeeters/cadabra2#tag=$pkgver" "package.patch")
md5sums=('SKIP'
         '2cf414a7280fd64858d1d19d38d4bd8c')
install=package.install

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
