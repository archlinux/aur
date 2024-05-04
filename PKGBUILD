# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kcontacts
pkgname=${_name}5
pkgver=5.116.0
pkgrel=1
pkgdesc='Address book API for KDE'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kcoreaddons5 kconfig5 ki18n5 kcodecs5)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
conflicts=("$_name<1:5.111")
replaces=("$_name<1:5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('f107fdec8f52f7362499159c958e57e3b8b1981b0d797a90685c4a604156b4cb'
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
