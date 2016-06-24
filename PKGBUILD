# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=oxygen-git
pkgver=r4045.d885ff0
pkgrel=2
pkgdesc='KDE Oxygen style'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kde-workspace'
license=(LGPL)
depends=(frameworkintegration-git kdecoration-git kcmutils-git)
makedepends=(extra-cmake-modules-git git kdoctools-git python)
optdepends=("oxygen-kde4-git: Oxygen widget style for KDE4 applications")
conflicts=(oxygen oxygen-cursors kdebase-workspace)
provides=(oxygen oxygen-cursors)
source=('git://anongit.kde.org/oxygen.git')
groups=('plasma')
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
