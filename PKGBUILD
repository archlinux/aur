# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.5.0
pkgrel=1
pkgdesc="KDE Config Module for Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx-qt5' 'knewstuff' 'kcmutils')
makedepends=('extra-cmake-modules')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('219b962c4b6f1763b389dc20d22a671d960a884f5c3f0faddbd4919b61dd6d93e600cbf440b15bc42f63cb383ed5ca65e657fa835c520196c8bd9d64a160baa3')

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
