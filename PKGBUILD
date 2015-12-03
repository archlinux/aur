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
source=("${_pkgname}-${pkgver}.tar.bz2::http://kde-apps.org/CONTENT/content-files/156421-${_pkgname}-${pkgver}.tar.bz2"
        "port_to_qt5.patch")
install="${pkgname}.install"
sha256sums=('aefb7296a5207e13c4f3624acb6fd3ea359972fbee7f618686f970036067f476' 'SKIP')

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
