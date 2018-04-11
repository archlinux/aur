# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client
pkgver=0.6.1
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards."
arch=('x86_64')
url='http://www.dennogumi.org/projects/danbooru-client'
license=('GPL3')
depends=('kdeclarative'
         'kfilemetadata'
         'qt5-declarative'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'python'
             )
source=("https://www.dennogumi.org/releases/danbooru-client-${pkgver}.tar.xz")
sha256sums=('bbdde0bba5a6ad13b7f7db31a94f0a846dbb7c6497f1d75c162d2ece071d14be')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../danbooru-client-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
