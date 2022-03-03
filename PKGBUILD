# Maintainer: restore <sanktuarium at web dot de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
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
pkgver=0.4.10.with.FreeOrionSDK.v12.1255.g6a9b32fec
pkgrel=1
pkgdesc="turn-based space empire and galactic conquest (4X) computer game"
url="http://www.freeorion.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs' 'python' 'sdl2' 'libvorbis' 'glew' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake' 'git')
provides=('freeorion')
conflicts=('freeorion')

source=("$pkgname::git+https://github.com/freeorion/freeorion.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  git describe --long --tags | sed 's/^with.FreeOrionSDK.v11-//;s/^/0.4.10./;s/-/./g'
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
