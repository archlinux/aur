# Maintainer: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes
pkgver=107
pkgrel=3
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use.'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
depends=('libpulse' 'gtksourceview2' 'libxv' 'libao' 'openal' 'sdl2')
conflicts=('bsnes-classic' 'bsnes-plus')
source=("https://download.byuu.org/""$pkgname""_v""$pkgver""-source.7z" 'package.patch')
sha256sums=('7b7fa745ce593f9912ce116bdf009cd2e70eb034cd7186264c4abedb87a5da36' '7fd8edb835667363a77cb9b2f58f5e5d2c87c32b249afe3edb26d5ae2eecbbd6')

prepare() {
  cd "$pkgname""_v""$pkgver""-source"

  patch --forward --strip=1 --input="${srcdir}/package.patch"
}

build() {
  cd "$pkgname""_v""$pkgver""-source"

  make -C higan
}

package() {
  cd "$pkgname""_v""$pkgver""-source"

  make -C higan prefix="$pkgdir/usr" install
}
