# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=avro-c
pkgver=1.9.2
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
sha256sums=('a79d0369f00272071989727e3ad08993d02815cd7e1180d058b8609d56e30aea')

build() {
  cd "$srcdir/avro-release-$pkgver/lang/c"

  msg2 'Building...'
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_CXX_FLAGS=-fPIC \
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
