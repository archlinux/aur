# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname='cadabra2'
pkgver=2.2.0
pkgrel=1
pkgdesc="A computer algebra system designed specifically for the solution of problems encountered in field theory."
arch=('i686' 'x86_64')
url="http://cadabra.science/"
license=('GPL')
conflicts=('cadabra2-git')
depends=(
  'boost-libs'
  'glibmm'
  'gmp'
  'gtkmm3'
  'jsoncpp'
  'mathjax'
  'pcre'
  'python-matplotlib'
  'python-sympy'
  'texlive-core'
)
makedepends=(
  'boost'
  'cmake'
  'git'
)
source=("$pkgname::git+https://github.com/kpeeters/cadabra2#tag=$pkgver" "package.patch")
md5sums=('SKIP'
         '2cf414a7280fd64858d1d19d38d4bd8c')
# install=package.install

# prepare() {
#   cd "${srcdir}/${pkgname}"
#   patch -Np1 -i ../package.patch
# }

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
