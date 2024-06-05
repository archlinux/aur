# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=elfutils-git
pkgver=0.191.r34.g30b5592a
pkgrel=1
pkgdesc="Utilities and libraries to handle ELF object files and DWARF debugging information"
arch=('i686' 'x86_64')
url="https://sourceware.org/elfutils/"
license=('GPL-3.0-or-later')
depends=('glibc' 'bzip2' 'sh' 'xz' 'zlib')
makedepends=('git')
provides=("elfutils=$pkgver" 'libelf')
conflicts=('elfutils' 'libelf')
options=('staticlibs')
source=("git+https://sourceware.org/git/elfutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "elfutils"

  git describe --long --tags | sed 's/^elfutils-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "elfutils"

  autoreconf -fi
  CFLAGS="$CFLAGS -ffat-lto-objects -g" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects -g" \
  ./configure \
    --prefix="/usr" \
    --program-prefix="eu-" \
    --enable-maintainer-mode
  make
}

check() {
  cd "elfutils"

  #make check
}

package() {
  cd "elfutils"

  make DESTDIR="$pkgdir" install
}
