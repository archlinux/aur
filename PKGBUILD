# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.5.5
pkgrel=2
pkgdesc="KDE Config Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx-qt5' 'knewstuff' 'kcmutils')
makedepends=('extra-cmake-modules')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz"{,.sig})
sha512sums=('e6a7bcad10003a956389ee266cf6d2f3730dafafcdd0bb43de328397749775e5cd305f16fdca2365e246c903677dba042da81a6dfd873aa1be74174e2b0b372e'
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
