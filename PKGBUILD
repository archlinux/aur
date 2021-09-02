# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor:  DJ Lucas <dj@linuxfromscratch.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libwbxml
pkgver=0.11.7
pkgrel=1
pkgdesc="Library and Tools to parse, encode and handle WBXML documents"
arch=('x86_64')
url="https://sourceforge.net/projects/libwbxml/"
license=('LGPL')
depends=('expat')
makedepends=('cmake' 'check')
source=(https://github.com/libwbxml/libwbxml/archive/refs/tags/$pkgname-$pkgver.tar.gz)
sha256sums=('35e2cf033066edebc0d96543c0bdde87273359e4f4e59291299d41e103bd6338')

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
