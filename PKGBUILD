# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache
pkgver=0.28.3
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://github.com/mbitsnbites/buildcache"
license=('zlib')
depends=('gcc-libs' 'openssl')
makedepends=('cmake')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mbitsnbites/buildcache/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c227b3e42877ae374de27aa329eb4a19e10f1c3f951462fa10a78ea61741ecb9')


build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    "src"
  make -C "_build"
}

check() {
  cd "$pkgname-$pkgver"

  make -C "_build" test
}

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
