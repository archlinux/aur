# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=labplot-kf5
pkgver=2.5.0
pkgrel=1
pkgdesc="A free software data analysis and visualization application, for two and three-dimensional graphical presentation of data sets and functions."
arch=('i686' 'x86_64')
url='http://labplot.sourceforge.net/'
license=('GPL')
depends=('gsl' 'fftw' 'netcdf' 'cfitsio' 'qt5-serialport' 'hicolor-icon-theme' 'syntax-highlighting' 'kxmlgui')
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools' 'kdesignerplugin' 'knewstuff')
source=("http://download.kde.org/stable/labplot/${pkgver}/labplot-${pkgver}.tar.xz"
	"labplot-kf5.install")
md5sums=('49dab9faab6e7498a1127d096935284f'
         '7dd4a598d34b8e21411dec1247752d99')
	 
install='labplot-kf5.install'

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../labplot-${pkgver} \
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
  cd ${pkgdir}/usr/share/applications
}
