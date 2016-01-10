# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=avro-c
pkgver=1.8.0.rc2
pkgrel=2
pkgdesc="C bindings for Avro data serialization framework"
arch=('i686' 'x86_64')
depends=('snappy' 'xz' 'zlib')
makedepends=('cmake' 'git' 'make' 'pkg-config')
optdepends=('asciidoc: build with documentation'
            'source-highlight: add syntax highlighting to documentation')
url="https://github.com/apache/avro"
license=('Apache')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/apache/avro/tar.gz/release-1.8.0-rc2)
sha256sums=('873f075ed045e2463485a3e8f7db49b236096a304c9e691ba9e5c49712ec6cbd')

build() {
  cd "$srcdir/avro-release-1.8.0-rc2/lang/c"

  msg2 'Building...'
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DTHREADSAFE=true
  make
}

package() {
  cd "$srcdir/avro-release-1.8.0-rc2/lang/c"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/avro-c"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C build/
}
