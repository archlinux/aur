# Maintainer: Antonio Rojas <arojas@archlinux.org> 

pkgname=ark-git
pkgver=r2885.dfc3cb8
pkgrel=1
pkgdesc='Archiving Tool'
arch=(i686 x86_64)
url='http://kde.org/applications/utilities/ark/'
license=(GPL)
depends=(kpty khtml libarchive hicolor-icon-theme)
makedepends=(extra-cmake-modules git kdoctools python)
optdepends=(p7zip zip unzip unrar)
conflicts=(kdeutils-ark ark ark-frameworks-git)
provides=(ark)
replaces=(ark-frameworks-git)
install=$pkgname.install
source=("git://anongit.kde.org/ark.git")
sha256sums=('SKIP')

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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
