# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alexander Potashev <aspotashev@gmail.com>

pkgname=libkvkontakte-frameworks-git
pkgver=4.70.0.r421.20384dd
pkgrel=1
pkgdesc="Library implementing VKontakte.ru API. KF5 Frameworks (GIT version)"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/libs/libkvkontakte"
license=('GPL')
depends=('kdelibs4support')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'cmake' 'python')
conflicts=('libkvkontakte')
provides=('libkvkontakte')
source=("git://anongit.kde.org/libkvkontakte#branch=frameworks")
sha1sums=('SKIP')

pkgver() {
  cd libkvkontakte
  _ver="$(cat CMakeLists.txt | grep LIBKVKONTAKTE_VERSION | head -n1 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkvkontakte \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}