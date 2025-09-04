# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache
pkgver=0.31.5
pkgrel=2
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('gcc-libs' 'openssl')
makedepends=('cmake')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bits-n-bites/buildcache/-/archive/v$pkgver/buildcache-v$pkgver.tar.gz")
sha256sums=('d725e89917209d3a90e457cfa2904240790c4f0a5753643884a9b682a55f40be')


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
