# Maintainer: Ted John <intelorca@gmail.com>
pkgname=libopenrct2
pkgver=0.1.0
pkgrel=1
pkgdesc='Base library for OpenRCT2'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://openrct2.website'
license=('GPL3')
depends=('curl' 'jansson' 'fontconfig' 'libpng' 'openssl' 'libzip')
makedepends=('cmake')
source=("https://github.com/OpenRCT2/OpenRCT2/archive/v$pkgver.tar.gz")
sha256sums=('0347a47d380fc18ea543928c92a13d1bdb4431573154afeb80fa33f1149e6992')

build() {
  cd "$srcdir/OpenRCT2-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr ..
  make libopenrct2
}

package() {
  cd "$srcdir/OpenRCT2-$pkgver/build"

  make DESTDIR="$pkgdir" install
  cd "$pkgdir/usr"

  # Currently the install target builds openrct2 which we don't want
  rm -rf bin share/applications share/icons share/man share/openrct2/shaders share/openrct2/title
}
