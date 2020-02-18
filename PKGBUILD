# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=5.18.1
pkgrel=1
pkgdesc="Plasma applet and services for creating encrypted vaults"
arch=(x86_64)
url="https://www.kde.org/"
license=(LGPL)
groups=(plasma)
depends=(plasma-workspace networkmanager-qt)
makedepends=(extra-cmake-modules)
optdepends=('encfs: to use encFS for encryption' 'cryfs: to use cryFS for encryption')
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('493c4fae8df78f58efdef5ca1eba7a2ea894f343c2f12645111fb8aa1177632f'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
