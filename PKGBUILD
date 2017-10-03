# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=freeorion
pkgver=0.4.7.1
pkgrel=1
pkgdesc="turn-based space empire and galactic conquest (4X) computer game"
url="http://www.freeorion.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake')
conflicts=('freeorion-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/freeorion/freeorion/releases/download/v0.4.7.1/FreeOrion_v0.4.7.1_2017-09-03.139ffd9_Source.tar.gz")
md5sums=('74f6338622cc1ff262fc1e4412f92d45')

prepare() {
  cd $srcdir/src-tarball

  mkdir -p build
}

build() {
  cd $srcdir/src-tarball/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..

  make
}

package() {
  cd $srcdir/src-tarball/build

  make DESTDIR=$pkgdir install
}
