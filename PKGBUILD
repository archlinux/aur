# Maintainer : talleyhoe <talleyhoe at protonmail dot com>
# Contributor: Erhad Husovic
pkgname='cadabra2-git'
pkgver=2.3.9.3
pkgrel=1
pkgdesc="A computer algebra system (pre-release version) designed specifically for the solution of problems encountered in field theory."
arch=('x86_64')
url="http://cadabra.science/"
license=('GPL')
conflicts=('cadabra2')
depends=(
  'boost-libs'
  'glibmm'
  'gmp'
  'gtkmm3'
  'jsoncpp'
  'mathjax'
  'pcre'
  'python-ipykernel'
  'python-matplotlib'
  'python-sympy'
  'texlive-latexextra'
  'texlive-science'
)
makedepends=(
  'git'
  'boost'
  'cmake'
)
source=("git+https://github.com/kpeeters/cadabra2.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/cadabra2"
  mkdir -p build
  cd build
  cmake -DCMAKE_SKIP_RPATH=true -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

check() {
  cd "$srcdir/cadabra2/build"
  make test
}

package() {
  cd "$srcdir/cadabra2/build"
  make DESTDIR="${pkgdir}" install
}
