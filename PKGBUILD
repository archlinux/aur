# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client-git
pkgver=v0.3.0.21.gef46a37
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards. (GIT Version)"
url="http://www.dennogumi.org/projects/danbooru-client"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('kdeclarative' 'kfilemetadata')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python')
conflicts=('danbooru-client')
provides=('danbooru-client')
source=("git+https://git.dennogumi.org/kde/danbooru-client.git")
sha1sums=('SKIP')
install=danbooru-client-git.install

pkgver() {
  cd danbooru-client
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../danbooru-client \
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