# Maintainer: foxfirecodes <foxfirecodes@gmail.com>
pkgname=sheepshaver-kanjitalk755-git
pkgver=r3554.94a9f6cc
pkgrel=1
pkgdesc="PowerPC Mac emulator from kanjitalk755's fork of SheepShaver"
arch=('x86_64')
url="https://github.com/kanjitalk755/macemu"
license=('GPL')
depends=(
  'sdl2'
  'gtk3'
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
  "sheepshaver.desktop"
  "sheepshaver.png"
)
md5sums=(
  'SKIP'
  '26488a7f4c93b78589e985c343d9ced6'
  '943c2a7455b58eff55dcf10627469609'
)

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
  install -Dm644 "$srcdir/sheepshaver.desktop" "$pkgdir/usr/share/applications/sheepshaver.desktop"
  install -Dm644 "$srcdir/sheepshaver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/sheepshaver.png"
}

