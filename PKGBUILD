# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.0.6
pkgrel=1
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=('x86_64')
url="https://github.com/microsoft/mimalloc"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f2fc0fbfb6384e85959897f129e5d5d9acc51bda536d5cabcd7d4177dbda9fb735b8a8c239b961f8bea31d37c9ae10f66da23aa91d497f95393253d4ac792bb3')
b2sums=('bd8a38cc0eab6ad950a63f494f24e6a91c50d2104335e9ce70963a7baadd26c7a2b7440b2fcabe502d9961549222873d017cb525bf5b32da967cf51aa167603c')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMI_BUILD_STATIC=OFF \
    -DMI_BUILD_OBJECT=OFF \
    -DMI_INSTALL_TOPLEVEL=ON

  cmake --build build
}

check() {
  cd build

  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
