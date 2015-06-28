# Maintainer: Kevin Ott <supercodingmonkey at gmail dot com>

pkgname=lib32-csfml
pkgver=2.1
pkgrel=2
pkgdesc='C bindings for SFML (32-bit)'
arch=('x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
depends=('lib32-sfml')
makedepends=('cmake')
provides=('lib32-csfml')
source=("http://www.sfml-dev.org/download/csfml/CSFML-${pkgver}-sources.zip")
md5sums=('70779275bb4595a7905febdfe8532099')

build() {
  cd "$srcdir/CSFML-${pkgver}"

  export CFLAGS='-m32'
  export CXXFLAGS='-m32'
  export LDFLAGS='-m32'

  mkdir -p build
  cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/CSFML-${pkgver}"/build

  mkdir -p "$pkgdir/usr/lib32"
  cp -a lib/*.so{,.*} "${pkgdir}/usr/lib32/"

  install -Dm644 ../license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
