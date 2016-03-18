# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=freeorion
pkgver=0.4.5
pkgrel=1
pkgdesc="turn-based space empire and galactic conquest (4X) computer game"
arch=('i686' 'x86_64')
url="https://github.com/freeorion/freeorion/"
license=('GPL2')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'libtiff' 'libjpeg-turbo' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake')
install=freeorion.install
conflicts=('freeorion-git')
source=("https://github.com/freeorion/freeorion/releases/download/v${pkgver}/FreeOrion_v${pkgver}_2015-09-01.f203162_Source.tar.gz"
        'freeorion.install')
md5sums=('706b8e9ab2ee29575a927e6f1c772d61'
         'bdbd69c55fa91add1f8b17ad7f23ee6d')

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
