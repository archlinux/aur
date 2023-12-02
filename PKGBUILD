# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=kdoctools
pkgname=${_name}5
pkgver=5.113.0
pkgrel=1
pkgdesc='Documentation generation from docbook'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(karchive5 docbook-xsl)
makedepends=(extra-cmake-modules perl-uri ki18n5 doxygen qt5-tools qt5-doc)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('4a7dd10c60796f433f48bde5b9ff5de0bd3430ba790d99d2cffa9e0bed27da31'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON \
    -DDocBookXSL_DIR=/usr/share/xml/docbook/xsl-stylesheets-1.79.2-nons
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
