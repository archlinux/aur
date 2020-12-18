# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: William Termini <aur@termini.me>

pkgname=basiliskii-git
pkgver=r2665.d684527b
pkgrel=1
pkgdesc="Open Source 68k Macintosh Emulator"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="http://basilisk.cebix.net"
license=(GPL)
depends=(gtk2 sdl vde2)
makedepends=(git)
provides=("basiliskii")
conflicts=(basiliskii)
source=("git+https://github.com/cebix/macemu")
sha256sums=('SKIP')

pkgver() {
  cd macemu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd macemu/BasiliskII/src/Unix
  ./autogen.sh \
    --prefix=/usr \
    --enable-sdl-video \
    --enable-sdl-audio \
    --enable-jit-compiler \
    --with-bincue \
    --with-vdeplug

  make -j1
}

package() {
  cd macemu/BasiliskII/src/Unix
  make DESTDIR="${pkgdir}" install
}
