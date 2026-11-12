# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=xombe
pkgver=0.1.0
pkgrel=1
pkgdesc='C99 library implementing AMBE 2400 and AMBE+2 used by D-STAR and DMR'
arch=('x86_64' 'aarch64')
url='https://github.com/9M2PJU/xombe'
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/9M2PJU/xombe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('499818e971926c3dbbc9a058a27faba825fbdd97f8c1ab58b578ba3848575633')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
