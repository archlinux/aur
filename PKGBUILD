# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=krunner
pkgname=${_name}5
pkgver=5.115.0
pkgrel=1
pkgdesc='Framework for providing different actions given a string query'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(plasma-framework5 threadweaver5)
makedepends=(extra-cmake-modules kdoctools5 doxygen qt5-tools qt5-doc)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('15e239bfeedaec305a2d8707db7d4f8982c2c181eb0c116ce51205d187c6fa29'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
