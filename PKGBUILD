# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-doctools
pkgver=6.28.0
pkgrel=1
pkgdesc='Documentation generation from docbook'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-doctools'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(docbook-xsl
         glibc
         karchive
         libstdc++
         libxml2
         libxslt
         qt6-base)
makedepends=(doxygen
             ki18n
             perl-uri
             qt6-tools
             sonic-frameworks-cmake-modules)
provides=(kdoctools)
conflicts=(kdoctools)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('876d02c6c46926c3cd08c1430c32ddd51dbbd25098b58089a43155a56cfcaf58')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DDocBookXSL_DIR=/usr/share/xml/docbook/xsl-stylesheets-nons
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
