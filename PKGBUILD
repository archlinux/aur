# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.1.9
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
url='https://github.com/microsoft/mimalloc'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('2cee000c5c79a946a89f77a98d1359d09eeb61e32ee50d9dc3e8b693b10e5f8309772ed8c08d0c73d1ce96d64690fe07c77ce7e3b8d96c4f62000a60615396b7')
b2sums=('a23c24531379f9a4d6ea802b4f0569ca93d3e22d8a92f9a58a5565eb5b91b9c0b120341c65c6b449ccd690b6f8c057179f7fea39fc04b1e83f2b309bb2b31f54')

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D MI_BUILD_STATIC=OFF \
    -D MI_BUILD_OBJECT=OFF \
    -D MI_INSTALL_TOPLEVEL=ON

  cmake --build build
}

check() {
  cd build

  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}
