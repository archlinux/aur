# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=checkasm
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool for verifying the correctness of assembly code, as well as performance benchmarking"
arch=('i686' 'x86_64')
url="https://checkasm.videolan.me/"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('meson' 'nasm')
provides=('libcheckasm.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://code.videolan.org/videolan/checkasm/-/archive/v$pkgver/checkasm-v$pkgver.tar.gz")
sha256sums=('0f98f70629bf3bf2514becd60e09f949f6dda74737f87926ba0eca87ada246fb')


build() {
  cd "$pkgname-v$pkgver"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Ddefault_library="both" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "$pkgname-v$pkgver"

  #meson test -C "_build"
}

package() {
  cd "$pkgname-v$pkgver"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/checkasm"
}
