# Maintainer:Antonio Rojas <arojas@archlinux.org>

pkgname=kgamma
pkgver=5.27.10
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='Adjust your monitor gamma settings'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(systemsettings)
makedepends=(extra-cmake-modules kdoctools5)
conflicts=(kgamma5)
replaces=(kgamma5)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('dd81bb62a35ce4fce4482ed498e4072a50f9ec1190ba2a9246139ba1e24ef570'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
