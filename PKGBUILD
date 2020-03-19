# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=xz
pkgname=$_target-$_pkgname
pkgver=5.2.5
pkgrel=1
pkgdesc='Library and command line tools for XZ and LZMA compressed files (ARM64)'
arch=(x86_64)
url='https://tukaani.org/xz/'
license=(GPL LGPL)
depends=()
makedepends=($_target-configure)
options=(!buildflags)
source=(
  https://tukaani.org/$_pkgname/$_pkgname-$pkgver.tar.gz{,.sig}
)
sha256sums=(
  'b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145'
  'SKIP'
)
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620')

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
  $_target-configure

  make
  popd
}

package() {
  cd $_srcdir
  pushd build-$_target
  make DESTDIR=${pkgdir} install
  popd
}
