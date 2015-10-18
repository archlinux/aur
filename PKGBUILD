# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alexander Potashev <aspotashev@gmail.com>

pkgname=libkvkontakte-git
pkgver=4.70.0.r438.0845fe3
pkgrel=1
pkgdesc="Library implementing VKontakte.ru API. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libkvkontakte'
license=('GPL')
depends=('kdewebkit')
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('libkvkontakte' 'libkvkontakte-frameworks-git')
source=('git://anongit.kde.org/libkvkontakte')
sha1sums=('SKIP')

pkgver() {
  cd libkvkontakte
  _ver="$(cat CMakeLists.txt | grep LIBKVKONTAKTE_VERSION | head -n1 | cut -d '"' -f2)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
