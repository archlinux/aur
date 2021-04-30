# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Kevin Ott <supercodingmonkey at gmail dot com>

pkgname=lib32-sfml
pkgver=2.5.1
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API (32-bit)'
arch=('x86_64')
url='http://www.sfml-dev.org'
license=('zlib')
depends=('lib32-libsndfile' 'lib32-libxrandr' 'lib32-libjpeg' 'lib32-openal' 'lib32-glew' 'lib32-freetype2' 'lib32-libx11' 'sfml')
makedepends=('gcc-multilib' 'cmake')
source=("$url/files/SFML-$pkgver-sources.zip")
md5sums=('8533b22888102b4f0883311385fb1c71')

build() {
  cd "$srcdir/SFML-$pkgver"

  export CFLAGS='-m32'
  export CXXFLAGS='-DGLXContextID=XID -m32'
  export LDFLAGS='-m32'

  mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSFML_BUILD_EXAMPLES=0 \
      -DSFML_BUILD_DOC=0 \
      -DSFML_INSTALL_PKGCONFIG_FILES=1 \
      -DLIB_SUFFIX=32
  make
}

package() {
  cd "$srcdir/SFML-$pkgver"/build

  install -dm755 "$pkgdir/usr/lib32/pkgconfig"
  cp -a lib/*.so{,.*} "$pkgdir/usr/lib32/"
  install -m755 tools/pkg-config/*.pc "$pkgdir/usr/lib32/pkgconfig"
}
