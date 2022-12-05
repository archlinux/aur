# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

basepkgname=networkmanager-qt
pkgname=${basepkgname}6
pkgver=5.100.0
pkgrel=1
pkgdesc='Qt wrapper for NetworkManager API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(networkmanager qt6-base)
makedepends=(extra-cmake-modules doxygen qt6-tools qt6-doc)
groups=(kf5)
conflicts=('networkmanager-qt>=6')
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$basepkgname-$pkgver.tar.xz{,.sig})
sha256sums=('d6612f26ef2b0a3acfc903ff53db306dba189a78a35fd2be948057eea36a635f'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>
options=(debug)

build() {
  cmake -B build -S $basepkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_PREFIX=/opt/KF5-qt6/
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
