# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=vcsn-git
_realname=vcsn
pkgver=v2.1.r384.g74679ab
pkgrel=2
pkgdesc="Finite state machine manipulation platform, consisting of a library and tools implemented on top of it."
arch=('i686' 'x86_64')
url="http://vcsn.lrde.epita.fr/"
license=('GPL3')
depends=('boost' 'gcc' 'ccache' 'libltdl' 'jupyter' 'mathjax' 'graphviz' 'yaml-cpp')
makedepends=('git' 'texlive-core' 'doxygen' 'python2-docutils')
conflicts=('vaucanson-git' 'vaucanson' 'vcsn')
provides=('vaucanson-git' 'vaucanson' 'vcsn')
options=(!buildflags)

source=(git+https://gitlab.lrde.epita.fr/vcsn/vcsn.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/${_realname}"
  ./tests/bin/vcsn python -c 'import vcsn; vcsn.B.expression("a").automaton()'
}

build() {
  cd "$srcdir/${_realname}"
  ./bootstrap
  ./configure --prefix="/usr" CXXFLAGS='-O3' CPPFLAGS='-DNDEBUG'
  make V=1
}

package() {
  cd "$srcdir/${_realname}"
  make install DESTDIR="$pkgdir"
}

