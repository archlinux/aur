# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtiff-git
pkgver=4.5.1.r2.gdf665f60
pkgrel=1
pkgdesc="TIFF library and utilities"
arch=('i686' 'x86_64')
url="https://libtiff.gitlab.io/libtiff/"
license=('custom')
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
  ./configure \
    --prefix="/usr" \
    --with-docdir="/usr/share/doc/libtiff"
  make
}

check() {
  cd "libtiff"

  make check
}

package() {
  cd "libtiff"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/libtiff"
}
