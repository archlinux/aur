# Maintainer: Mladen Pejaković 

pkgname=sweeper-frameworks-git
pkgver=r328.37cb09f
pkgrel=1
pkgdesc='System Cleaner'
arch=(i686 x86_64)
url='https://www.kde.org/applications/utilities/sweeper'
license=(GPL)
depends=('kdelibs4support' 'kinit')
makedepends=('extra-cmake-modules' 'kdoctools')
conflicts=('kdeutils-sweeper' 'sweeper')
replaces=('kdeutils-sweeper')
provides=('sweeper')
groups=('kde-applications' 'kdeutils')
source=("git://anongit.kde.org/sweeper.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd sweeper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../sweeper \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
