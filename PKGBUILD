# Maintainer: Marat Moustafine <m-dash-moustafine-at-yandex-dot-ru>

_pkgname=how-to-use-pvs-studio-free
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc='An utility that adds special comments to a source code for analyzing the code by PVS-Studio for free'
arch=('i686' 'x86_64')
url=https://github.com/viva64/$_pkgname
license=('APACHE')
makedepends=('cmake' 'git')
optdepends=('pvs-studio: for the PVS-Studio code analyzer')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git
        add-comments-to-headers-too.patch)
sha256sums=('SKIP'
            '8de3ba2cc20f9752edc2e9932a6bc2c92bec2fddc24ee5c01a9fd587c93c6878')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -r 's/^v//;s/-/+/g'
}

# prepare() {
#   cd $_pkgname
#   patch -p1 -i $srcdir/${source[1]}
# }

build () {
  cd $_pkgname
  mkdir -p build

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR=$pkgdir install
}
