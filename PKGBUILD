# Maintainer: cclin <cclinet@outlook.com>
pkgname=redis-plus-plus
pkgver=1.2.1
pkgrel=1
pkgdesc='A C++ client for Redis based on hiredis written in C++ 11 / C++ 17.'
arch=('x86_64')
url="https://github.com/sewenew/redis-plus-plus"
license=('Apache')
depends=('glibc' 'hiredis')
makedepends=('cmake')
source=(https://github.com/sewenew/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('2a0b5fe5119ec973a0c1966bfc4bd7ed39dbce1cb6d749064af9121fe971936f')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DREDIS_PLUS_PLUS_BUILD_STATIC=OFF -DREDIS_PLUS_PLUS_BUILD_TEST=OFF 
  make -B build
}

package() {
  install -Dm 644 $pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  cd build
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
sha256sums=('f09c9fcc362955edb887632cd008102887278c94934d7e8c9d0acb8707671902')
