# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client-git
pkgver=v0.6.0.0.ga8a4038
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
             'git'
             'python'
             )
conflicts=('danbooru-client')
provides=('danbooru-client')
source=('git+https://git.dennogumi.org/kde/danbooru-client.git')
sha1sums=('SKIP')

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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
