# Maintainer: William Termini <aur@termini.me>
pkgname=basiliskii-git
pkgver=r2403.b58a926
pkgrel=1
pkgdesc="an Open Source 68k Macintosh emulator"
arch=('any')
url="http://basilisk.cebix.net/"
license=('GPL')
depends=(sdl gtk2)
makedepends=(git make autoconf)
conflicts=('basiliskii')
sha1sums=('SKIP')
source=(git+https://github.com/cebix/macemu.git)


pkgver() {
  cd "$srcdir/macemu"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}





build() {
  cd "$srcdir/macemu"
  msg "Starting build..."
  #
  # BUILD HERE
  #
  cd BasiliskII
  cd src/Unix
  NO_CONFIGURE=1 ./autogen.sh
  ./configure --enable-sdl-video --enable-sdl-audio --disable-vosf --enable-jit-compiler --prefix=/usr
  make
strip BasiliskII
}

package() {
  echo "Making Package"
  cd "$srcdir/$_gitname-build/BasiliskII/src/Unix"
  make DESTDIR="$pkgdir/" install
}

