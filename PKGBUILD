# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kquickimageeditor
pkgname=kquickimageeditor5
pkgver=0.3.0
pkgrel=4
pkgdesc='QML image editing components (Qt5)'
license=(LGPL-2.1-or-later)
arch=(x86_64)
url='https://invent.kde.org/libraries/kquickimageeditor'
depends=(gcc-libs
         glibc
         kirigami2
         qt5-base
         qt5-declarative)
makedepends=(extra-cmake-modules)
conflicts=('kquickimageeditor<0.3.0-2')
replaces=('kquickimageeditor<0.3.0-2')
source=(https://download.kde.org/stable/$_name/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('330ebf3653883eeebde54385d783c51c2d30ff77d41b294ece79af7e9c21c6f8'
            'SKIP')
validpgpkeys=(39FFA93CAE9C6AFC212AD00202325448204E452A) # Carl Schwan <carl@carlschwan.eu>

build() {
  cmake -B build -S $_name-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
# fix conflicts with Qt6 version
  mv "$pkgdir"/usr/lib/cmake/KQuickImageEditor{,5}
}
