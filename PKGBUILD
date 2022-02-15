# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.0.5
pkgrel=1
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=('x86_64')
url="https://github.com/microsoft/mimalloc"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d164392ace523a3fa0aa00fc58d8a9e8fbe913f07957e19ca977675b389e6d2a2eaf4772e72cae0d87aabb960f3fd6ea3923a066ece4ba4fdaa0c6860cfa414d')
b2sums=('9148ba4af7620eec36e1dde0f6fd2d1e3e9937bd2286ac790a727052402c3286b55387236de3a77e4405983c080bb7acae8deb3334cf9103fcf3f90250080204')

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
