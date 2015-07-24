# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=kdebugsettings
pkgname=$_gitname-git
pkgver=r125.1ca4ca4
pkgrel=1
pkgdesc='An application to enable/disable qCDebug'
arch=(i686 x86_64)
url='http://projects.kde.org/kdebugsettings'
license=(GPL)
depends=(ki18n kcompletion kdbusaddons kitemviews kcoreaddons)
makedepends=(extra-cmake-modules git)
provides=(kdebugsettings)
conflicts=(kdebugsettings)
source=("git://anongit.kde.org/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
