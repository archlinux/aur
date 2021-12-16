# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.0.3
pkgrel=2
pkgdesc="General-purpose allocator with excellent performance characteristics"
arch=('x86_64')
url="https://github.com/microsoft/mimalloc"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('275a5249d09a57c9a039714fc6eef24ae778496954972419f3ac8e33f3d12e9837ba0691a3c08a4ab807c26b868aad3a5b2c28ee10ecaa60fe21ffe1d416f08f')
b2sums=('4b803881ab75afa358cb2dd251268c0934472074bf1983c3851a9d4f8c8ec0ea3907b52c40b0efe1cc09916cf4c5aa93f786a606e0b999536118b91bb5800310')

prepare() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMI_BUILD_STATIC=OFF \
    -DMI_BUILD_OBJECT=OFF \
    -DMI_INSTALL_TOPLEVEL=ON
}

build() {
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
