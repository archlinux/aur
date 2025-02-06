# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=picolibc
pkgver=1.8.9
pkgrel=1
pkgdesc="A C library designed for embedded 32 and 64 bit systems"
arch=('i686' 'x86_64')
url="https://keithp.com/picolibc/"
license=('LicenseRef-picolibc')
makedepends=('glibc' 'meson')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/picolibc/picolibc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('323394e5b1dfb7afe994195136ab83729e9678e0f2cd912a81b71de6d27d4689')


build() {
  cd "$pkgname-$pkgver"

  # ref: scripts/do-amd64-configure
  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --includedir="include/picolibc" \
    --libdir="lib/picolibc" \
    -Dmultilib="false" \
    "_build"
  meson compile -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "COPYING.picolibc" -t "$pkgdir/usr/share/licenses/picolibc"
}
