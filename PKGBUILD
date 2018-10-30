# Maintainer: Drommer <sergey.starovoytov.94@gmail.com>

pkgname=breath-gtk-theme
pkgver=5.9.0
pkgrel=1
_gitcommit=da2706640f457f89de6c26312e391b244ff550b4
url=https://gitlab.manjaro.org/artwork/themes/breath-gtk
arch=('any')
license=('LGPL')
makedepends=('extra-cmake-modules' 'plasma-framework')

source=("breath-gtk-theme-$pkgver.tar.gz::$url/-/archive/master/breath-breath-gtk-$_gitcommit.tar.gz")
sha256sums=('ff00e9c8ded97b55077771a1c33c412ea65a8a8e8a70dbc1ae680cafcc286752')

prepare() {
  mv $srcdir/breath-gtk-master-$_gitcommit $srcdir/${pkgname}
  mkdir -p $srcdir/${pkgname}/build
}

build() {
  cd $srcdir/${pkgname}/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd $srcdir/${pkgname}/build
  make DESTDIR="${pkgdir}" install
}
