# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod
pkgver=3.3.2
pkgrel=1
pkgdesc="A portable sound library"
license=(GPL LGPL)
url="http://mikmod.shlomifish.org/"
arch=(x86_64)
depends=(libmikmod lib32-openal)
makedepends=(gcc-multilib libtool-multilib lib32-alsa-lib)
options=('!libtool')
source=($url/files/libmikmod-$pkgver.tar.gz)
sha256sums=('2311b209255bf24e95161907a16778cb054ac6d447fd8d05f1f0e41a555c7580')

prepare() {
  mkdir build
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  ../libmikmod-$pkgver/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-openal \
    --disable-static
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share,bin}
}

