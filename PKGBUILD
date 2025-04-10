# Maintainer: Kristopher James Kent <kris@kjkent.dev>
pkgname='fusefatfs'

arch=('x86_64')
b2sums=('b46570eaf913a69642203d039ae23f1c215c097ae4973eeaf45427a376971ba0651fbba7ba1e4f9078ed541f4913c2faee6db148f961b18c6ff68fe4675be056')
depends=('fuse3') 
license=('GPL-2.0-only')
makedepends=('cmake>=3.12.0')
pkgdesc='FUSE/VUOS module for FAT (12/16/32/exFAT)'
pkgrel='1'
pkgver='0.3'
url="https://github.com/virtualsquare/$pkgname"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
# The source tarball downloads as $pkgname-$pkgver.tar.gz
_src="$pkgname-$pkgver"
_build="$_src/build"

build() {
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -S "$_src" -B "$_build"
  make  -j`nproc` -C "$_build"
}

package() {
  make DESTDIR="$pkgdir" -C "$_build" install
}
