# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=plasma5-applets-todolist
pkgver=4
pkgrel=1
pkgdesc="Extension of the kdeplasma-applets notes widget, where it's organized as a list"
url="https://github.com/Zren/plasma-applets/tree/master/todolist"
license=(GPL)
depends=('plasma-workspace' 'qt5-declarative')
makedepends=('extra-cmake-modules')
arch=('any')
source=(https://github.com/Zren/plasma-applets/archive/todolist-$pkgver.tar.gz
	https://raw.githubusercontent.com/kikadf/patches/master/plasma5-applets-todolist/Add_CMakeLists.patch)
md5sums=('29f9cd302f97fe2116b798cffb6fd333'
         '3881942579d0e79c4e1e78ae570cbcd9')

prepare() {
  cd plasma-applets-todolist-$pkgver/todolist
  patch -p2 -i "${srcdir}"/Add_CMakeLists.patch
  rm -f build
  mkdir -p build
}

build() {
  cd plasma-applets-todolist-$pkgver/todolist/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd plasma-applets-todolist-$pkgver/todolist/build
  make DESTDIR="$pkgdir" install
}
