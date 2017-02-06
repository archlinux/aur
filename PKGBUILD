# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=freeorion
pkgver=0.4.6
pkgrel=1
pkgdesc="turn-based space empire and galactic conquest (4X) computer game"
url="http://www.freeorion.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'libtiff' 'libjpeg-turbo' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake')
install=freeorion.install
conflicts=('freeorion-git')
source=("https://github.com/freeorion/freeorion/releases/download/v$pkgver/FreeOrion_v${pkgver}_2016-09-16.49f9123_Source.tar.gz"
        'freeorion.install')
md5sums=('2927818ca87834ec7cc6e77b11619186'
         '45ab05125b7409da2768c18182818bb0')

prepare() {
  cd $srcdir/src-tarball

  mkdir -p build
}

build() {
  cd $srcdir/src-tarball/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..

  make
}

package() {
  cd $srcdir/src-tarball/build

  make DESTDIR=$pkgdir install
}
