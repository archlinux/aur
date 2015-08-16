# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolab-git
pkgver=2.0.r369.51aadb1
pkgrel=1
pkgdesc="Advanced Kolab Object Handling Library. (GIT Version)"
url='https://kolab.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libkolabxml-git'
         'kcontacts-git'
         'kcalutils-git'
         #'kdepimlibs-akonadi-notes-git'
         #'kdepimlibs-akonadi-git'
         )
makedepends=('git' 'cmake' 'kdoctools' 'boost' 'swig')
conflicts=('libkolab')
source=('git+https://git.kolab.org/diffusion/LK/libkolab.git')
sha1sums=('SKIP')

pkgver() {
  cd libkolab
  _ver="$(cat CMakeLists.txt | grep -m2 -e Libkolab_VERSION_MAJOR -e Libkolab_VERSION_MINOR | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkolab \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
