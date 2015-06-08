# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kde-gtk-config-git
pkgver=r414.44ab445
pkgrel=1
pkgdesc='GTK2 and GTK3 Configurator for KDE'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/kde-gtk-config'
license=(LGPL)
depends=(kcmutils knewstuff)
makedepends=(extra-cmake-modules git gtk2 gtk3)
conflicts=(kde-gtk-config)
provides=(kde-gtk-config)
install=$pkgname.install
source=('git://anongit.kde.org/kde-gtk-config.git')
md5sums=('SKIP')

pkgver() {
  cd kde-gtk-config
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kde-gtk-config \
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
