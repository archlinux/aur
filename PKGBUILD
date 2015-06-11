# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds

# Original credits go toxantares

pkgname=tinyxml2
pkgver=3.0.0
pkgrel=1
pkgdesc='Simple, small, C++ XML parser that can be easily integrated into other programs'
url="https://github.com/leethomason/$pkgname"
arch=('x86_64' 'i686')
license=('zlib')
depends=('gcc-libs')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('26584d2c1666aea5e664c105eb4e8153')

_prefix='/usr'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_INSTALL_LIBDIR=$_prefix/lib \
    -DBUILD_STATIC_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
