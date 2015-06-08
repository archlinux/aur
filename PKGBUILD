# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kwin-git
pkgver=r12920.60783b8
pkgrel=1
pkgdesc='KDE Window Manager'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kde-workspace'
license=(LGPL)
depends=(hicolor-icon-theme qt5-multimedia plasma-framework-git kcmutils-git knewstuff-git kinit-git kdecoration-git xcb-util-cursor 
kwayland-git libinput)
makedepends=(extra-cmake-modules git kdoctools qt5-tools)
conflicts=(kwin kdebase-workspace)
provides=(kwin)
install=$pkgname.install
source=('git://anongit.kde.org/kwin.git')
md5sums=('SKIP')

pkgver() {
  cd kwin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
