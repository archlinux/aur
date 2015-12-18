# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.5.3
pkgrel=1
pkgdesc="KDE Config Module for Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx-qt5' 'knewstuff' 'kcmutils')
makedepends=('extra-cmake-modules')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
sha512sums=('19d172cbf1d2a13f289b64b67488ddc5ba83a9d26503438045271c85df3775715614951652dc6f8da52a3b9d692d6e2138a760fc51d1e7f0f8bb0bd467265496')

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
