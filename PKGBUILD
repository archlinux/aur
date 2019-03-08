# Maintainer: Elaina Martineau <elainamartineau@gmail.com>

pkgname=bsnes
pkgver=107
pkgrel=1
pkgdesc='Super Nintendo emulator focusing on performance, features, and ease of use.'
arch=('x86_64')
url='https://byuu.org/emulation/bsnes/'
license=('GPL3')
groups=()
depends=('libpulse' 'gtksourceview2' 'libxv' 'libao' 'openal' 'sdl2')
makedepends=()
optdepends=()
provides=()
conflicts=('bsnes-classic' 'bsnes-plus')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.byuu.org/""$pkgname""_v""$pkgver""-source.7z")
noextract=()
sha256sums=('7b7fa745ce593f9912ce116bdf009cd2e70eb034cd7186264c4abedb87a5da36')

prepare() {
  cd "$pkgname""_v""$pkgver""-source"

  # Allow us to build as root
  sed -i '37 d; 38 d; 39 s/else //' higan/target-bsnes/GNUmakefile
}

build() {
  cd "$pkgname""_v""$pkgver""-source"

  make -C higan
}

package() {
  cd "$pkgname""_v""$pkgver""-source"

  make -C higan prefix="$pkgdir/usr" install
}
