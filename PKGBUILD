# Contributor:: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=kwalletmanager4
epoch=1
pkgver=4.14.3
pkgrel=1
pkgdesc='KDE Wallet Management Tool (KDE4 version)'
url='http://kde.org/applications/system/kwalletmanager/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdebase-runtime' 'kdepimlibs')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=("http://download.kde.org/stable/${pkgver}/src/kwalletmanager-${pkgver}.tar.xz")
sha1sums=('99981321f1891a77008bb2de4985f09739e75ef3')

prepare() {
  rm -rf build && mkdir build
}

build() {
  cd build
  cmake ../kwalletmanager-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  # prepare for co-installation with kwalletmanager5
  rm -rf "${pkgdir}"/usr/share/icons
}
