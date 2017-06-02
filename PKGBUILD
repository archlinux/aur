# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=avro-c
pkgver=1.8.2
pkgrel=1
pkgdesc="C bindings for Avro data serialization framework"
arch=('i686' 'x86_64')
depends=('jansson' 'snappy' 'xz' 'zlib')
makedepends=('cmake' 'git' 'make' 'pkg-config')
optdepends=('asciidoc: build with documentation'
            'source-highlight: add syntax highlighting to documentation')
url="https://github.com/apache/avro"
license=('Apache')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/apache/avro/tar.gz/release-$pkgver)
sha256sums=('b3eedd781dd5ceda812f4bd911bc82cb46c8a50e92c003b6ccc4ff66014fb01c')

build() {
  cd "$srcdir/avro-release-$pkgver/lang/c"

  msg2 'Building...'
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DTHREADSAFE=true
  make
}

package() {
  cd "$srcdir/avro-release-$pkgver/lang/c"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/avro-c"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C build/
}
