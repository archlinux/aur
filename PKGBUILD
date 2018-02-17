# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=freeorion
pkgver=0.4.7.1
pkgrel=2
pkgdesc="turn-based space empire and galactic conquest (4X) computer game"
url="http://www.freeorion.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake')
conflicts=('freeorion-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/freeorion/freeorion/releases/download/v0.4.7.1/FreeOrion_v0.4.7.1_2017-09-03.139ffd9_Source.tar.gz"
        https://github.com/freeorion/freeorion/commit/c9b5b13fb81b1ed142dee0e843101c6b8832ca95.patch)
md5sums=('74f6338622cc1ff262fc1e4412f92d45'
         'f05e32e2357b96cf9bfdd1b6d9b899ad')

prepare() {
  cd $srcdir/src-tarball

  mkdir -p build

  patch -Np1 -i $srcdir/c9b5b13fb81b1ed142dee0e843101c6b8832ca95.patch
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
