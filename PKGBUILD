# Maintainer: R. V. Lobato <rvlobato at pm dot me>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname=cadabra2
pkgver=2.3.9.3
pkgrel=1
pkgdesc="A field-theory motivated approach to computer algebra"
arch=('x86_64')
url="https://cadabra.science"
license=('GPL')
conflicts=('cadabra2-git')
depends=(boost-libs glibmm gmp gtkmm3 jsoncpp mathjax pcre
	 python-ipykernel python-matplotlib python-sympy sqlite
	 texlive-latexextra texlive-science)

makedepends=(boost cmake)

source=($pkgname-$pkgver.tar.gz::"https://github.com/kpeeters/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('288284535bd4b0165f436aa4d4908e98044d4f2def5f661261bb358f6888279e')

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
