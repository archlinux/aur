# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=oxygen-git
pkgver=r4003.bcf0fd7
pkgrel=1
pkgdesc='KDE Oxygen style'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kde-workspace'
license=(LGPL)
depends=(frameworkintegration-git kdecoration-git kcmutils-git)
makedepends=(extra-cmake-modules git kdoctools python)
optdepends=("oxygen-kde4-git: Oxygen widget style for KDE4 applications")
conflicts=(oxygen oxygen-cursors kdebase-workspace)
provides=(oxygen oxygen-cursors)
source=('git://anongit.kde.org/oxygen.git')
md5sums=('SKIP')

pkgver() {
  cd oxygen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../oxygen \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
