# Maintainer: Em Zhan <zqianem@gmail.com>

pkgname=nceplibs-g2c
_pkgname=NCEPLIBS-g2c
pkgver=2.3.0
pkgrel=2
pkgdesc="C decoder/encoder routines for GRIB edition 2"
arch=('x86_64')
url="https://github.com/NOAA-EMC/NCEPLIBS-g2c"
license=('LGPL-3.0-only')
depends=('jasper' 'libpng' 'zlib' 'openjpeg2' 'libaec')
makedepends=('cmake')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8520a24c066500cfd0d07a05c6b7b0cb92383d1a4737cf6e79d9f4919c8e79ab')
options=('staticlibs')

build() {
  cmake -B build -S "$srcdir/$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUSE_AEC=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
