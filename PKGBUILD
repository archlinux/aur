# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache
pkgver=0.31.0
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('gcc-libs' 'openssl')
makedepends=('cmake')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bits-n-bites/buildcache/-/archive/v$pkgver/buildcache-v$pkgver.tar.gz")
sha256sums=('d46edb98072f34635851952c1547061463355d01ecaba9d1fd6122cbebbba105')


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
