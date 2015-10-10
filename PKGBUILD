# Maintainer: Tajidin Abd <tajidinabd at archlinux dot us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ark-git
pkgver=r3007.f1cf10f
pkgrel=1
pkgdesc="Archiving Tool"
arch=(i686 x86_64)
url='http://kde.org/applications/utilities/ark/'
license=(GPL)
depends=(kpty-git khtml-git libarchive hicolor-icon-theme)
makedepends=(extra-cmake-modules-git git kdoctools-git python)
optdepends=(p7zip zip unzip unrar)
provides=(ark)
conflicts=(ark kdeutils-ark)
source=('git://anongit.kde.org/ark.git')
md5sums=('SKIP')

pkgver() {
  cd ark
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ark \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
