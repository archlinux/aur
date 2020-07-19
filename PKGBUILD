# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kwin-git
pkgver=v5.19.2.r110.g898bd496d
pkgrel=2
pkgdesc='KDE Window Manager'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kde-workspace'
license=(LGPL)
depends=(breeze-git qt5-sensors qt5-script plasma-framework-git kcmutils-git xcb-util-cursor kscreenlocker-git kwayland-server)
makedepends=(extra-cmake-modules-git git kdoctools-git qt5-tools)
conflicts=(kwin kdebase-workspace)
provides=(kwin)
source=('git+https://github.com/KDE/kwin.git')
groups=('plasma')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
