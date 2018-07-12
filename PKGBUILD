# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=gr-limesdr
pkgver=1.0.0
_gitver=$pkgver-RC
pkgrel=1
pkgdesc="gr-limesdr Plugin for GNURadio"
arch=('any')
url="https://github.com/myriadrf/gr-limesdr"
license=('MIT')
optdepends=(
  'doxygen: generate documentation'
  'swig: bindings'
  'python2: python bindings'
)
depends=('boost' 'gnuradio' 'limesuite')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_gitver.tar.gz")
sha256sums=('a6be1bfd2cbfeef33aa8e91fa35720bfad9d4b7dc4a29afb08dfcee451f6c32e')

build() {
  mkdir -p "$srcdir"/$pkgname-$_gitver/build
  cd "$srcdir"/$pkgname-$_gitver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$pkgname-$_gitver/build

  make DESTDIR="$pkgdir" install
}
