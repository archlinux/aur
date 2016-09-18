# Maintainer:  gandalf3 [ zzyxpaw at gmail dot com ]
# Submitter:   maz-1 < ohmygod19993 at gmail dot com >

_pkgname=kde-thumbnailer-blender
pkgname=${_pkgname}-kf5-git
pkgver=7.efd0ded
pkgrel=1
pkgdesc="Preview image generator plugin for Blender files. Latest version from upstream git"
arch=('i686' 'x86_64')                                                                       
url="https://github.com/kayosiii/kde-thumbnailer-blender"                                                  
license=('GPL')                                                    
depends=('kdelibs4support' 'zlib')
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools' 'qt5-tools')
conflicts=("$_pkgname" "${_pkgname}-kf5")
source=("git://github.com/kayosiii/kde-thumbnailer-blender.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
