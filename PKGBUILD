# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Mainrainer: Antonio Rojas <arojas@archlinux.org>

_name=modemmanager-qt
pkgname=${_name}5
pkgver=5.110.0
pkgrel=1
pkgdesc='Qt wrapper for ModemManager DBus API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(modemmanager qt5-base)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
provides=($_name=$pkgver)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('3b9c2a548b3032a180088b59f93955f415ea19b1ec7f0639ce01e1d4b31a0423'
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
