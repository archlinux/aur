# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: cassfalg <cassfalg-git@gmx.de>
# Contributor: Christian Bühler <christian@cbuehler.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Elmo Todurov <todurov@gmail.com>
# Contributor: guini <sidtrun@googlemail.com>
# Contributor: Forrest Loomis <cybercyst _ at _ gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: fana-m <geminin@gmx.net>

pkgname=freeorion-git
pkgver=r19815.b87d8aceb
pkgrel=1
pkgdesc="turn-based space empire and galactic conquest (4X) computer game"
url="http://www.freeorion.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake' 'git')
provides=('freeorion')
conflicts=('freeorion')

source=("$pkgname::git+https://github.com/freeorion/freeorion.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname

  mkdir -p build
}

build() {
  cd $srcdir/$pkgname/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..

  make
}

package() {
  cd $srcdir/$pkgname/build

  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
