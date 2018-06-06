# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=plasma5-applets-volumewin7mixer
pkgver=23
pkgrel=1
pkgdesc="A fork of the default volume plasmoid with a Windows 7 theme (vertical sliders)"
arch=('any')
url="https://github.com/Zren/plasma-applet-volumewin7mixer"
license=(GPL)
depends=('plasma-pa' 'qt5-declarative' 'python2')
makedepends=('extra-cmake-modules')
source=(https://github.com/Zren/plasma-applet-volumewin7mixer/archive/v$pkgver.tar.gz
        https://gitlab.com/kikadf/patches/raw/master/plasma5-applets-volumewin7mixer/Add_CMakeLists.patch)
md5sums=('99bf48315a4711db9bfd1b91c0cbf2e1'
         'd8c46ebcd65232cb7a4d2a9c9621fb97')

prepare() {
  cd plasma-applet-volumewin7mixer-$pkgver
  patch -p1 -i ../Add_CMakeLists.patch
  rm -f build
  mkdir -p build
}

build() {
  cd plasma-applet-volumewin7mixer-$pkgver/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd plasma-applet-volumewin7mixer-$pkgver/build
  make DESTDIR="$pkgdir" install
}
