# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtiff-git
pkgver=4.6.0.r198.g4e63559f
pkgrel=1
pkgdesc="TIFF library and utilities"
arch=('i686' 'x86_64')
url="https://libtiff.gitlab.io/libtiff/"
license=('libtiff')
depends=('glibc' 'libjpeg' 'xz' 'zlib' 'zstd')
makedepends=('git' 'freeglut' 'glu' 'jbigkit' 'mesa')
optdepends=('freeglut: for using tiffgt')
provides=("libtiff=$pkgver")
conflicts=('libtiff')
options=('staticlibs')
source=("git+https://gitlab.com/libtiff/libtiff.git")
sha256sums=('SKIP')


pkgver() {
  cd "libtiff"

  git describe --long --tags | sed 's/^Release-v//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libtiff"

  autoreconf -fi
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --with-docdir="/usr/share/doc/libtiff"
  make
}

check() {
  cd "libtiff"

  #make check
}

package() {
  cd "libtiff"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/libtiff"
}
