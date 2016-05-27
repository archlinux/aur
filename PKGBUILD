# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=vcsn
pkgver=2.2
pkgrel=2
pkgdesc="Finite state machine manipulation platform, consisting of a library and tools implemented on top of it."
arch=('i686' 'x86_64')
url="http://vcsn.lrde.epita.fr/"
license=('GPL3')
depends=('boost' 'gcc' 'ccache' 'libltdl' 'jupyter' 'mathjax' 'graphviz')
makedepends=('texlive-core' 'doxygen' 'python2-docutils')
options=(!buildflags)

source=("https://www.lrde.epita.fr/dload/vcsn/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('48e479d34a047df4507d1e7b322bfb16')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./tests/bin/vcsn python -c 'import vcsn; vcsn.B.expression("a").automaton()'
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="/usr" CXXFLAGS='-O3' CPPFLAGS='-DNDEBUG'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

