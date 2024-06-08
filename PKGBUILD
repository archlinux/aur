# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.1.7
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
url='https://github.com/microsoft/mimalloc'
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('75d1ee7c25b6e53d1da25ab21b4140331cad4af72f7ff19e72f2a7c57715dfd3cbd4642b8f7cd5ae5a8695ed6a9592cb4cc20c340e09fb42abc619b245203c51')
b2sums=('afa823bee649bce039f9cb70ab5e222dd17b967fcefaf215b43fa55bbed11d5369add2a1471f8d5f606c2d62b1c4fd9b2e5c0a7a924ea390cc7d321ab2f15e53')

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -D CMAKE_INSTALL_PREFIX=/usr \
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
