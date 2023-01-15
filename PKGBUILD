# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkscreen
pkgver=5.26.5
pkgrel=1
pkgdesc='KDE screen management software'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(qt5-x11extras libxrandr kwayland kconfig)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc plasma-wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('a591d20167eb64552658e0d40c6fcbc0aabaced3ad4984744b20d9bbe57f526d'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
