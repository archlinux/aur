# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=labplot-kf5
pkgver=2.1.0
pkgrel=2
pkgdesc="A free software data analysis and visualization application, for two and three-dimensional graphical presentation of data sets and functions."
arch=('i686' 'x86_64')
url='http://labplot.sourceforge.net/'
license=('GPL')
depends=('kdebase-runtime' 'kde-cli-tools' 'gsl')
makedepends=('cmake' 'extra-cmake-modules')
source=("http://download.kde.org/stable/labplot/${pkgver}/src/labplot-kf5-${pkgver}.tar.xz")
md5sums=('7ca4deb2a009f0da4349fda695a43788')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
