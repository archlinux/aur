# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=vcsn
pkgver=2.5
pkgrel=2
pkgdesc="Finite state machine manipulation platform, consisting of a library and tools implemented on top of it."
arch=('i686' 'x86_64')
url="http://vcsn.lrde.epita.fr/"
license=('GPL3')
depends=('boost' 'gcc' 'ccache' 'libltdl' 'jupyter' 'mathjax' 'graphviz' 'yaml-cpp')
optdepends=('python-regex: to get better error messages')
makedepends=('texlive-core' 'doxygen' 'python2-docutils')
options=(!buildflags)

source=("https://www.lrde.epita.fr/dload/vcsn/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('54d3c20c93787c0584af06996c3b01bb')

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

