# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgname=vcsn-git
_realname=vaucanson
pkgver=v2.0.r1065.g650cb77
pkgrel=2
pkgdesc="Finite state machine manipulation platform, consisting of a library and tools implemented on top of it."
arch=('i686' 'x86_64')
url="http://vaucanson.lrde.epita.fr/"
license=('GPL3')
depends=('boost' 'gcc' 'ccache' 'libltdl' 'jupyter')
makedepends=('git' 'texlive-core' 'doxygen' 'python2-docutils')
conflicts=('vaucanson-git' 'vaucanson' 'vcsn')
provides=('vaucanson-git' 'vaucanson' 'vcsn')

source=(git+https://gitlab.lrde.epita.fr/vcsn/vcsn.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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

