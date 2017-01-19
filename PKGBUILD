# Maintainier: maz-1 < ohmygod19993 at gmail dot com >
# Contributor: Frikilinux <frikilinux at gmail.com>
# Contributor: Artem Sereda <overmind88@gmail.com>

_pkgname=kde-thumbnailer-apk
pkgname=${_pkgname}-kf5
pkgver=1.0
pkgrel=2
pkgdesc="Preview image generator plugin for Android Application Package files. KF5 Ver."                                                                                      
arch=('i686' 'x86_64')                                                                       
url="http://kde-apps.org/content/show.php?content=156421"                                                  
license=('GPL')                                                    
depends=('kdelibs4support')
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools' 'qt5-tools')
conflicts=("$_pkgname")
source=("${_pkgname}-${pkgver}.tar.bz2::https://dl.opendesktop.org/api/files/download/id/1460972065/156421-${_pkgname}-${pkgver}.tar.bz2"
        "port_to_qt5.patch")
install="${pkgname}.install"
md5sums=('200c6a1109e6cc77694c4d147e9d8763'
            '0c1dccca83fcdb69d006d901f4ecf5cd')

prepare() {
    cd "${srcdir}"/${_pkgname}
    patch -p1 < ../port_to_qt5.patch
}
build() {
  cd "${srcdir}"/${_pkgname}
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" install
}
