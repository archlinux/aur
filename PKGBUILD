# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=kdoctools
pkgname=${_name}5
pkgver=5.116.0
pkgrel=3
pkgdesc='Documentation generation from docbook'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(karchive5 docbook-xsl)
makedepends=(extra-cmake-modules perl-uri ki18n5)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('36a0a60e422907b2baead8b82cec56008240b7a950678294bb2e1df65e1a6bb3'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DDocBookXSL_DIR=/usr/share/xml/docbook/xsl-stylesheets-nons
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
