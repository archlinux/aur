# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Mainrainer: Antonio Rojas <arojas@archlinux.org>

basepkgname=modemmanager-qt
pkgname=${basepkgname}6
pkgver=5.100.0
pkgrel=1
pkgdesc='Qt wrapper for ModemManager DBus API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(modemmanager qt6-base)
makedepends=(extra-cmake-modules doxygen qt6-tools qt6-doc)
groups=(kf5)
conflicts=('modemmanager-qt>=6')
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$basepkgname-$pkgver.tar.xz{,.sig})
sha256sums=('dea540b4a1ec5784749892191015cbc31c021a64944f010b59c7c13e2140f474'
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
