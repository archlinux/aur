# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache
pkgver=0.31.2
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('gcc-libs' 'openssl')
makedepends=('cmake')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bits-n-bites/buildcache/-/archive/v$pkgver/buildcache-v$pkgver.tar.gz")
sha256sums=('df8aff0b10144e737088bf2c7178c2fbac220de5035c2ee3b6bc88357dcc64e9')


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
