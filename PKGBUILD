# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=libksysguard
pkgname=libksysguard-light
pkgver=5.25.0
pkgrel=1
pkgdesc='Libraries for ksysguard to retrieve information on the current status of computer hardware without the big dependency on qt5-webengine'
arch=(x86_64)
url='   https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(libxres knewstuff)
makedepends=(extra-cmake-modules kdoctools qt5-tools)
conflicts=(libksysguard 'ksysguard<5.21.90')
groups=(plasma)
replaces=(libksysguard)
provides=(libksysguard)
source=(https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz{,.sig})
install=libksysguard.install
sha256sums=('345790b3dab1d6b7e5f1ace8e2616517661a736c37b285578b959401b60441fc'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
