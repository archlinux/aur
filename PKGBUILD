# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor:  DJ Lucas <dj@linuxfromscratch.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libwbxml
pkgver=0.11.7
pkgrel=2
pkgdesc="Library and Tools to parse, encode and handle WBXML documents"
arch=('x86_64')
url="https://github.com/libwbxml/libwbxml"
license=('LGPL')
depends=('expat')
makedepends=('cmake' 'check')
source=(https://github.com/libwbxml/libwbxml/archive/refs/tags/$pkgname-$pkgver.tar.gz
        0001-Fix-crash-on-corrupted-wbxml.patch
        0002-Allow-the-use-of-a-namespace-specified-separator.patch
        0003-Change-the-default-internal-namespace-separator.patch)
sha256sums=('35e2cf033066edebc0d96543c0bdde87273359e4f4e59291299d41e103bd6338'
            'd3c3bcc8f204305ee5cd8acb20bab08b94c4eabfef1f0c324058728bb6b47d92'
            '0e7dd497194cad9e78949b9025d372610ae8ffd855914658031f04ca11b554ce'
            'd2fea06a64270e460f8b95af65e472f44a07f6e096fa1e3776bbe294ffb845b5')

prepare() {
  cd libwbxml-libwbxml-$pkgver
  sed '/AUTHORS/d' -i CMakeLists.txt

  patch -p1 -i ../0001-Fix-crash-on-corrupted-wbxml.patch
  patch -p1 -i ../0002-Allow-the-use-of-a-namespace-specified-separator.patch
  patch -p1 -i ../0003-Change-the-default-internal-namespace-separator.patch

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
