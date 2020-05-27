# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mladen Pejaković 

pkgname=sweeper-frameworks-git
pkgver=r487.4ab73f4
pkgrel=1
pkgdesc='System Cleaner'
url='https://kde.org/applications/utilities/sweeper'
arch=(i686 x86_64)
license=(GPL LGPL FDL)
depends=(kactivities-stats kio)
makedepends=(extra-cmake-modules kdoctools)
groups=(kde-applications kde-utilities)
conflicts=('kdeutils-sweeper' 'sweeper')
replaces=('kdeutils-sweeper')
provides=('sweeper')
source=("git+https://github.com/KDE/sweeper.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/sweeper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/sweeper
  mkdir -p build
}

build() { 
  cd $srcdir/sweeper/build
  cmake ../ \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd $srcdir/sweeper/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.LIB "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
