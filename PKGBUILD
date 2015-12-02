# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client
pkgver=0.4.0
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards. (GIT Version)"
arch=('i686' 'x86_64')
url='http://www.dennogumi.org/projects/danbooru-client'
license=('GPL3')
depends=('kdeclarative'
         'kfilemetadata'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'python'
             )
source=("https://www.dennogumi.org/releases/danbooru-client-${pkgver}.tar.xz")
sha1sums=('e3c4fc2c2934f8c2423b9270b8efad5aa963a3d9')
install=danbooru-client.install

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../danbooru-client-${pkgver}" \
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
