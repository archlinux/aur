# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=freeorion
pkgver=0.4.8
pkgrel=1
pkgdesc="turn-based space empire and galactic conquest (4X) computer game"
url="http://www.freeorion.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake')
conflicts=('freeorion-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/freeorion/freeorion/releases/download/v0.4.8/FreeOrion_v0.4.8_2018-08-23.26f16b0_Source.tar.gz")
md5sums=('c3ad0186b868e939688483713d0d8dec')

prepare() {
  # shellcheck disable=2154
  cd "$srcdir"/src-tarball || exit 1

  mkdir -p build
}

build() {
  # shellcheck disable=2154
  cd "$srcdir"/src-tarball/build || exit 1

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..

  make
}

package() {
  # shellcheck disable=2154
  cd "$srcdir"/src-tarball/build || exit 1

  # shellcheck disable=2154
  make DESTDIR="$pkgdir" install
}
