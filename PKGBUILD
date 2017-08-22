# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=labplot-kf5
pkgver=2.4.0
pkgrel=3
pkgdesc="A free software data analysis and visualization application, for two and three-dimensional graphical presentation of data sets and functions."
arch=('i686' 'x86_64')
url='http://labplot.sourceforge.net/'
license=('GPL')
depends=('kdebase-runtime' 'gsl' 'kdelibs4support' 'fftw' 'netcdf' 'cfitsio')
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools' 'kdesignerplugin' 'knewstuff')
source=("http://download.kde.org/stable/labplot/${pkgver}/labplot-${pkgver}-kf5.tar.xz"
	"labplot-kf5.install")
md5sums=('fe7cdefc5abfae5321b77973450aaa1d'
         '7dd4a598d34b8e21411dec1247752d99')
	 
install='labplot-kf5.install'

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../labplot-${pkgver}-kf5 \
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
