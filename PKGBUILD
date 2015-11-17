# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alexander Potashev <aspotashev@gmail.com>

pkgname=libkvkontakte-git
pkgver=r440.fd5dfce
pkgrel=1
pkgdesc="Library implementing VKontakte.ru API. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libkvkontakte'
license=('GPL')
depends=('kdewebkit')
makedepends=('extra-cmake-modules-git' 'kdoctools' 'git')
conflicts=('libkvkontakte' 'libkvkontakte-frameworks-git')
groups=('digikamsc-git')
source=('git://anongit.kde.org/libkvkontakte')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/libkvkontakte"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "${srcdir}/libkvkontakte" -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DLIB_INSTALL_DIR=lib \
                -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}