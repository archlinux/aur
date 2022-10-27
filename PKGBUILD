# Maintainer: R. V. Lobato <rvlobato at pm dot me>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname=cadabra2
pkgver=2.4.2.1
pkgrel=1
pkgdesc="A field-theory motivated approach to computer algebra"
arch=('x86_64')
url="https://cadabra.science"
license=('GPL')
conflicts=('cadabra2-git')
depends=(boost-libs glibmm gmp gtkmm3 jsoncpp python python-gmpy2 jupyterlab python-matplotlib
	 python-sympy sqlite texlive-bin texlive-latexextra texlive-science)

optdepends=('mathjax: Doxygen documentation'
	    'doxygen: Doxygen documentation'
	   )

makedepends=(boost cmake pybind11)

source=($pkgname-$pkgver.tar.gz::"https://github.com/kpeeters/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9cdee23f92e99813f76be6864aa3b0cf4711c4635ea5f90ec9dcbef5858f4045')

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-$pkgver \
	-DCMAKE_INSTALL_PREFIX='/usr'
  make
}

check() {
  cd "$srcdir/build"
  make test
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
