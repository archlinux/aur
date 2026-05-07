# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache
pkgver=0.32.0
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl')
makedepends=('cmake')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bits-n-bites/buildcache/-/archive/v$pkgver/buildcache-v$pkgver.tar.gz")
sha256sums=('9bfca6d5d9e27b669018e46f8836a0a70a5950da8cd21c32a94f27514ed44366')


build() {
  cd "$pkgname-v$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    "src"
  cmake --build "_build"
}

check() {
  cd "$pkgname-v$pkgver"

  #cmake --build "_build" --target test
}

package() {
  cd "$pkgname-v$pkgver"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
