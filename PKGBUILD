# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.5.4
pkgrel=1
pkgdesc="KDE Config Module for Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx-qt5' 'knewstuff' 'kcmutils')
makedepends=('extra-cmake-modules' 'python')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('349fe50303e027f44b53d954c088e441450aad07dac3a1162a5dcf9c445ca9d04bd3c36475c17dab91ed2df9c3c71031d7582e39b85ad0465a816f7fc24ac0bd')

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
