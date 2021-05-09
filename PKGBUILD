# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=basiliskii-kanjitalk755-git
pkgver=r3205.8a28ad6e
pkgrel=1
pkgdesc="Open Source 68k Macintosh Emulator"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/kanjitalk755/macemu"
license=(GPL)
depends=(gtk2 sdl vde2)
makedepends=(git)
provides=(basiliskii)
conflicts=(basiliskii)
source=("kanjitalk755-macemu::git+https://github.com/kanjitalk755/macemu")
sha256sums=('SKIP')

pkgver() {
  cd kanjitalk755-macemu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd kanjitalk755-macemu

  cd BasiliskII/src/Unix
  NO_CONFIGURE=1 ./autogen.sh
}

build() {
  cd kanjitalk755-macemu/BasiliskII/src/Unix
  ./configure \
    --prefix=/usr \
    --enable-sdl-video \
    --enable-sdl-audio \
    --enable-jit-compiler \
    --with-bincue \
    --with-vdeplug

  make -j1
}

package() {
  cd kanjitalk755-macemu/BasiliskII/src/Unix
  make DESTDIR="${pkgdir}" install
}
