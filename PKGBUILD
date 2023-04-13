# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-bigscreen
pkgver=5.27.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plasma shell for TVs'
arch=(x86_64)
url='https://plasma-bigscreen.org/'
license=(GPL2)
depends=(plasma-pa plasma-nm plasma-nano plasma-settings kdeconnect qt5-virtualkeyboard plasma-remotecontrollers)
makedepends=(extra-cmake-modules)
optdepends=('aura-browser: web browser' 'plank-player: media player')
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('97a9a17822a4d722f08cb2db8fe9ac3b7b48ad4b47b09032496336afc67c4da2'
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
