# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=picolibc
pkgver=1.7.9
pkgrel=2
pkgdesc="A C library designed for embedded 32 and 64 bit systems"
arch=('i686' 'x86_64')
url="https://keithp.com/picolibc/"
license=('GPL')
makedepends=('glibc' 'meson')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/picolibc/picolibc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ad08e5b849a7c64338896f99177a0215cd47a805efcdf625eb4c9bc1b39bd1d3')


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
}
