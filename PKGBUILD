# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Antonio Rojas 

pkgname=kscreengenie-frameworks-git
pkgver=r44.91d1539
pkgrel=1
pkgdesc='Screen Capture Program'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/graphics/kscreengenie/repository'
license=('GPL')
depends=('libkipi-frameworks-git' 'kparts')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('kdegraphics-ksnapshot' 'ksnapshot' 'kscreengenie')
provides=('kscreengenie' 'ksnapshot')
source=("git://anongit.kde.org/kscreengenie.git")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd kscreengenie
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../kscreengenie \
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
