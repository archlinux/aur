pkgname=libksane-git
pkgver=r547.08ea3fb
pkgrel=1
pkgdesc='An image scanning library'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base' 'sane' 'ktextwidgets' 'kwallet')
makedepends=('git' 'extra-cmake-modules-git' 'kdoctools')
conflicts=('libksane')
provides=('libksane')
groups=('digikamsc-git')
source=('libksane::git+https://invent.kde.org/graphics/libksane.git/')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libksane"
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
  cmake "${srcdir}/libksane" -DCMAKE_BUILD_TYPE=Release \
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
