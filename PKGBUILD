# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kcontacts
pkgname=${_name}5
pkgver=5.110.0
pkgrel=2
pkgdesc='Address book API for KDE'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kcoreaddons5 kconfig5 ki18n5 kcodecs5)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
conflicts=("$_name<1:5.111")
replaces=("$_name<1:5.111")
provides=($_name=$pkgver)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('840c0322610f11dfd8ba7b5c91495a8df8dd3955c66ddc3c5c33151da9452b3e'
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
