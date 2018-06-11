# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=plasma5-applets-todolist
pkgver=7
pkgrel=1
pkgdesc="Extension of the kdeplasma-applets notes widget, where it's organized as a list"
url="https://github.com/Zren/plasma-applet-todolist"
license=(GPL)
depends=('plasma-workspace' 'qt5-declarative')
makedepends=('extra-cmake-modules')
arch=('any')
source=(https://github.com/Zren/plasma-applet-todolist/archive/v$pkgver.tar.gz
	https://gitlab.com/kikadf/patches/raw/master/plasma5-applets-todolist/Add_CMakeLists.patch)
md5sums=('d79af3b345f3e798b0f3e0210c465639'
         '3881942579d0e79c4e1e78ae570cbcd9')

prepare() {
  cd plasma-applet-todolist-$pkgver/todolist
  patch -p2 -i "${srcdir}"/Add_CMakeLists.patch
  rm -f build
  mkdir -p build
}

build() {
  cd plasma-applet-todolist-$pkgver/todolist/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd plasma-applet-todolist-$pkgver/todolist/build
  make DESTDIR="$pkgdir" install
}
