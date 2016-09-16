# Maintainer: Ken Hasselmann <arch AT kenh DOT fr>

pkgname=argos3-git
_gitname=argos3
pkgver=3.0.0.beta43.r6.gb16f6be
pkgrel=1

pkgdesc="ARGoS 3 Large-scale robot simulator"
arch=('i686' 'x86_64')
url="http://www.argos-sim.info"
license=('MIT')

depends=('freeimage>=3.15' 'qt4>=4.6' 'freeglut>=2.6.0' 'libxi' 'libxmu' 'lua' 'doxygen>=1.7.3' 'graphviz>=2.28' 'asciidoc>=8.6.2')
makedepends=('gcc>=4.3' 'git' 'cmake>=2.6')

source=('git://github.com/ilpincy/argos3.git')
# sha256sums=('8a4f7ae34558b2b858851a233f3d0b968be1daf091ece0adc04cfa5a7b74cddc')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  mkdir build_simulator
  cd build_simulator
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
}

package() {
  cd "$srcdir/$_gitname"
  cd build_simulator
  make DESTDIR="$pkgdir/" doc
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/doc $pkgdir/usr/share/
}

# vim:set ts=2 sw=2 et:
