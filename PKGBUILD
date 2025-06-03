# Maintainer: Antonio Rojas <arojas@archlinux.org>
# # Contributor: Diana Ward <diana.ward535@proton.me>

_name=qqc2-desktop-style
pkgname=${_name}5
pkgver=5.116.1
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kirigami2 kiconthemes5 sonnet5)
makedepends=(extra-cmake-modules qt5-tools)
provides=('qqc2-desktop-style5')
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)  
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('18e412afb0c5cefe179d1a07074b2e4daa0062085c79381123ba7c3f77d520df'
            'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
