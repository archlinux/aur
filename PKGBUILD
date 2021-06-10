# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=libksysguard
pkgname=libksysguard-light
pkgver=5.22.0
pkgrel=2
pkgdesc='Libraries for ksysguard to retrieve information on the current status of computer hardware without the big dependency on qt5-webengine'
arch=(x86_64)
url='   https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(libxres kdeclarative knewstuff)
makedepends=(extra-cmake-modules kdoctools qt5-tools)
conflicts=(libksysguard 'ksysguard<5.21.90')
groups=(plasma)
replaces=(libksysguard)
provides=(libksysguard)
source=(https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/libksysguard/-/commit/9dc314d8.patch)
install=libksysguard.install
sha256sums=('a2d3973aaf7d5c4a1cb6dd463ec8183dd4e9a6c6b851df4b8824f8dd562607a9'
            'SKIP'
            '2e0ddf9cc5c9aa52e8f559100543148ceec9c7aaacdb64b49fe54827a94d2f1d')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $_pkgname-$pkgver -p1 < 9dc314d8.patch # Fix network monitor applet
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
