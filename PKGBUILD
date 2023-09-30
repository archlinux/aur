# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=aura-browser
pkgver=5.27.8
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='Browser for a fully immersed Big Screen experience allowing you to navigate the world wide web using just your remote control'
arch=(x86_64)
url='https://plasma-bigscreen.org/'
license=(GPL2)
depends=(kirigami2 ki18n5 qt5-webengine qt5-multimedia qt5-virtualkeyboard)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('1081be5dd4493f3670967f4c05672214ee361b2e7fc4ea0c0d8d76c81368c324'
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
