# Maintainer: Zitro <u4595650016@protonmail.com>
# Contributor: Adam Fontenot <adam.m.fontenot+AUR1@gmail.com>
# Contributor: Faheem Pervez < trippin1 gmail >

pkgname=colord-kde-git
pkgver=0.3.0.r48.g3729d13
pkgrel=1
pkgdesc="colord integration for KDE Frameworks 5"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/graphics/colord-kde'
license=('GPL')
makedepends=('git' 'extra-cmake-modules')
depends=('colord' 'kcmutils' 'kio' 'libxrandr' 'desktop-file-utils')
optdepends=('gnome-color-manager: manual calibration')
provides=('colord-kde')
conflicts=('colord-kde')
source=("$pkgname::git+https://invent.kde.org/graphics/colord-kde.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^COLORD_KDE_//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
