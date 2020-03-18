# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=libffi
pkgname=$_target-$_pkgname
pkgver=3.2.1
pkgrel=2
pkgdesc='Portable foreign function interface library (ARM64)'
arch=(x86_64)
url='http://sourceware.org/libffi/'
license=(MIT)
depends=($_target-glibc)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  ftp://sourceware.org/pub/libffi/libffi-$pkgver.tar.gz
)
sha256sums=(
  'd06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37'
)

_srcdir=$_pkgname-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-configure --enable-pax_emutramp
  make
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install
  popd
}
