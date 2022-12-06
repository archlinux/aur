# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kxmlrpcclient
pkgver=5.100.0
pkgrel=1
pkgdesc='XML-RPC client library'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kio)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
groups=(kf5-aids)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/portingAids/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('b946ffebb297777fe0fda19b00e4f2bc3a8624ab4cb301bd5c818b83d49cce3a'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>
options=(debug)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
