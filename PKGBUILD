# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client
pkgver=0.6.0
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
sha1sums=('9bf35cd266fd0d656168345ae50bbdf37653b4ba')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../danbooru-client-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
