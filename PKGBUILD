# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgorigname=kwin
pkgname=kwin-presentwindows-close
pkgver=5.6.4
pkgrel=1
pkgdesc='KDE Window manager, reverting the removal of the close action in present windows'
arch=('i686' 'x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
depends=('qt5-multimedia' 'kscreenlocker' 'knewstuff' 'xcb-util-cursor' 'hicolor-icon-theme' 'kdecoration' 'kinit' 'plasma-framework' 'kcmutils')
makedepends=('extra-cmake-modules' 'qt5-tools' 'kdoctools' 'libinput' 'python')
optdepends=('libinput: for kwin-wayland')
groups=('plasma')
conflicts=('kdebase-workspace' 'kwin')
provides=('kwin')
source=("http://download.kde.org/stable/plasma/${pkgver}/${_pkgorigname}-${pkgver}.tar.xz" presentwindows-close.patch)
md5sums=('6afbe6f1659cac2e186dcce9f92f51de'
         '84538b8d5331a3f3f59cc31e393025d2')

prepare() {
  mkdir -p build

  cd $_pkgorigname-$pkgver
  patch -p1 -R < ../presentwindows-close.patch
}

build() {
  cd build
  cmake ../${_pkgorigname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
