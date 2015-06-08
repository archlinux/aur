# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client
pkgver=0.3.0
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards. (GIT Version)"
url="http://www.dennogumi.org/projects/danbooru-client"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('kdeclarative' 'kfilemetadata')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("https://www.dennogumi.org/releases/danbooru-client-${pkgver}.tar.xz"
        'ki18n.patch::https://git.dennogumi.org/kde/danbooru-client/commit/4021ccaf23958b466fe8ccc6aac993d64312b846.diff'
        'desktop.patch::https://git.dennogumi.org/kde/danbooru-client/commit/ef46a379a06775a5328ced0d4b2636e2fbe322e5.diff')
sha1sums=('4ec0319773008778bf5c01c1e725dda85af29f60'
          '08b8b35553417712ef9346d33fb582578acc70c9'
          '36017c379062ce839b41a27f2fc974e76f6abda5')
install=danbooru-client.install

prepare() {
  mkdir -p build

  patch -d "danbooru-client-${pkgver}" -p1 -i ../ki18n.patch
  patch -d "danbooru-client-${pkgver}" -p1 -i ../desktop.patch
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