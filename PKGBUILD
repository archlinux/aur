# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=picolibc
pkgver=1.8.1
pkgrel=1
pkgdesc="A C library designed for embedded 32 and 64 bit systems"
arch=('i686' 'x86_64')
url="https://keithp.com/picolibc/"
license=('GPL')
makedepends=('glibc' 'meson')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/picolibc/picolibc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('acf51183c09ed21ffe5f9a175b1eeb61f634496f4d1dd0c8ab4e0d29cc1bf0c4')


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
