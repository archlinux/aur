# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=5.13.1
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
sha256sums=('76e84c0981d6cb43e11c997a3f325b15185b91577d49c3033a3d8f65df2a8f2f'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
