# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.5.6
pkgrel=1
pkgdesc="KDE Config Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx-qt5' 'knewstuff' 'kcmutils')
makedepends=('extra-cmake-modules')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz"{,.sig})
sha512sums=('a3d378ecd9ea9fa5bcc42c75e5b0b0ac2ba6c94fda93b7213d821546bb83b5904c75c2fc9482cd7b47fbf5ad81a0641b7ec345aa2e630c8795bf8d5b89f9cd3b'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  mkdir build
}

build() {
  cd build

  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
