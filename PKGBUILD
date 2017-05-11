# $Id: PKGBUILD 265462 2016-04-19 15:09:32Z arojas $
# Maintainer: Michael Serpieri <mickybart@pygoscelis.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-hybris
_pkgname=kwin
pkgver=5.9.5
pkgrel=2
pkgdesc='KDE Window manager'
arch=('i686' 'x86_64' 'armv7h')
url='https://projects.kde.org/projects/kde/workspace/kwin'
license=('LGPL')
depends=('kscreenlocker' 'xcb-util-cursor' 'hicolor-icon-theme' 'plasma-framework' 'kcmutils' 'breeze' 'libhybris' 'xorg-server-xwayland')
makedepends=('extra-cmake-modules' 'qt5-tools' 'kdoctools' 'python')
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland')
groups=('plasma')
provides=('kwin')
conflicts=('kdebase-workspace' 'kwin')
source=("kwin::git+https://github.com/mickybart/kwin#branch=sf-v${pkgver}")
md5sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname} \
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
