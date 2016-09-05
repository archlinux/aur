# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Kevin Ott <supercodingmonkey at gmail dot com>

pkgname=lib32-csfml
pkgver=2.3
pkgrel=1
pkgdesc='C bindings for SFML (32-bit)'
arch=('x86_64')
url='http://www.sfml-dev.org'
license=('zlib')
depends=('lib32-sfml')
makedepends=('cmake')
source=("$url/files/CSFML-$pkgver-sources.zip")
md5sums=('4c5cfbd3179884b6f9f872d7a8fd19c4')

build() {
  cd "$srcdir/CSFML-$pkgver"

  export CFLAGS='-m32'
  export CXXFLAGS='-m32'
  export LDFLAGS='-m32'

  mkdir -p build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCSFML_BUILD_DOC=false
  make
}

package() {
  cd "$srcdir/CSFML-$pkgver"/build

  install -dm755 "$pkgdir/usr/lib32"
  cp -a lib/*.so{,.*} "$pkgdir/usr/lib32/"

  install -Dm644 ../license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
