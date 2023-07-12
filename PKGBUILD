# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=rom-properties
pkgver=2.2
pkgrel=1
pkgdesc='This shell extension adds a few nice features to file browsers for managing video game ROM and disc images.'
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL2')
depends=('curl' 'zlib' 'libpng' 'libjpeg-turbo' 'nettle' 'tinyxml2' 'libseccomp')
optdepends=('zstd' 'lz4' 'lzo')
makedepends=('cmake' 'pkgconf' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v$pkgver.tar.gz")
sha256sums=('eef7f41036124ea49ddd59f2460808c25537b9e8ba96f70ac75ebc39014c8232')

build() {
  cd "$pkgname-$pkgver"

  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib/$pkgname -DCMAKE_BUILD_TYPE=Release -DSPLIT_DEBUG=OFF
  make
}

package() {
  cd "$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
