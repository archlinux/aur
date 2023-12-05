# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plank-player
pkgver=5.27.10
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Multimedia Player for playing local files on Plasma Bigscreen allowing navigation with just a remote control'
arch=(x86_64)
url='https://plasma-bigscreen.org/'
license=(GPL2)
depends=(kirigami2 ki18n5 qt5-multimedia qt5-graphicaleffects hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('2b8ece5b7ea268327dbad08d0859a889cb4e0df90651b3c835dabfcc5f8e2d12'
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
