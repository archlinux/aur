# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>

_gitname=akonadi
pkgname=$_gitname-git
pkgver=r2787.d006a0f
pkgrel=1
pkgdesc="PIM layer, which provides an asynchronous API to access all kind of PIM data"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('LGPL')
depends=('qt5-base' 'shared-mime-info' 'mariadb')
makedepends=('git' 'extra-cmake-modules-git' 'postgresql')
conflicts=("$_gitname")
provides=("$_gitname")
source=("git://anongit.kde.org/$_gitname")
install=$pkgname.install
sha256sums=("SKIP")

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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DAKONADI_BUILD_TESTS=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
