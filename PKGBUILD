# Maintainier: maz-1 < ohmygod19993 at gmail dot com >
# Contributor: Frikilinux <frikilinux at gmail.com>
# Contributor: Artem Sereda <overmind88@gmail.com>

_pkgname=kde-thumbnailer-apk
pkgname=${_pkgname}-kf5
pkgver=20170128.gc8f141c
pkgrel=1
pkgdesc="Preview image generator plugin for Android Application Package files. KF5 Ver."                                                                                      
arch=('i686' 'x86_64')                                                                       
url="http://kde-apps.org/content/show.php?content=156421"                                                  
license=('GPL')                                                    
depends=('kio' 'karchive')
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools' 'qt5-tools')
conflicts=("$_pkgname")
source=("git+https://github.com/z3ntu/kde-thumbnailer-apk")
install="${pkgname}.install"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  echo "$(git show -s --format="%ci"|grep -oP '\d{4}-\d{2}-\d{2}'|sed 's:-::g').g$(git describe --always)"
}

prepare() {
  rm -rf build
  mkdir -p build
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
