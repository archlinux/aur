# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor:  DJ Lucas <dj@linuxfromscratch.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libwbxml
pkgver=0.11.10
pkgrel=1
pkgdesc="Library and Tools to parse, encode and handle WBXML documents"
arch=('x86_64')
url="https://github.com/libwbxml/libwbxml"
license=('LGPL')
depends=('expat')
makedepends=('cmake' 'check')
source=(https://github.com/libwbxml/libwbxml/archive/refs/tags/$pkgname-$pkgver.tar.gz)
sha256sums=('027b77ab7c06458b73cbcf1f06f9cf73b65acdbb2ac170b234c1d736069acae4')

prepare() {
  cd libwbxml-libwbxml-$pkgver
  sed '/AUTHORS/d' -i CMakeLists.txt

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd libwbxml-libwbxml-$pkgver/build
  make
}

package() {
  cd libwbxml-libwbxml-$pkgver/build
  make DESTDIR=${pkgdir} install
}
