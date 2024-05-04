# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Mainrainer: Antonio Rojas <arojas@archlinux.org>

_name=modemmanager-qt
pkgname=${_name}5
pkgver=5.116.0
pkgrel=1
pkgdesc='Qt wrapper for ModemManager DBus API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(modemmanager qt5-base)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('06055351f3a6f8755df60f48b3fdaabb4a406939b9c777f474e8a22bdd116f80'
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
