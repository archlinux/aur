# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache
pkgver=0.27.3
pkgrel=2
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://github.com/mbitsnbites/buildcache"
license=('zlib')
depends=('gcc-libs' 'openssl')
makedepends=('cmake')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mbitsnbites/buildcache/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad804ba05c7785186fc6e4fc2872d02b55b19a67a257fb3b556942f96aebc613')


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
