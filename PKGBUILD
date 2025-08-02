# Maintainer: foxfirecodes <foxfirecodes@gmail.com>
pkgname=sheepshaver-kanjitalk755-git
pkgver=r3554.94a9f6cc
pkgrel=1
pkgdesc="PowerPC Mac emulator from kanjitalk755's fork of SheepShaver (JIT/non-JIT, GTK3 + SDL2)"
arch=('x86_64' 'aarch64')
url="https://github.com/kanjitalk755/macemu"
license=('GPL')
depends=(
  'sdl2'
  'gtk3'
  'glib2'
  'pango'
  'cairo'
  'gdk-pixbuf2'
  'atk'
  'libxrandr'
  'libxext'
  'libsm'
  'libgl'
  'zlib'
)
makedepends=(
  'git'
  'gcc'
  'make'
  'autoconf'
  'automake'
  'perl'
  'glib2'  # for glib-compile-resources
)
provides=('sheepshaver')
conflicts=('sheepshaver')
source=(
  "git+https://github.com/kanjitalk755/macemu.git"
  "sheepshaver-kanjitalk755.desktop"
  "sheepshaver-icon.png"
)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/macemu"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/macemu/SheepShaver/src/Unix"
  ./autogen.sh
  make
}

package() {
  install -Dm755 "$srcdir/macemu/SheepShaver/src/Unix/SheepShaver" "$pkgdir/usr/bin/sheepshaver-kanjitalk755"
  install -Dm644 "$srcdir/sheepshaver-kanjitalk755.desktop" "$pkgdir/usr/share/applications/sheepshaver-kanjitalk755.desktop"
  install -Dm644 "$srcdir/sheepshaver-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/sheepshaver-kanjitalk755.png"
}

