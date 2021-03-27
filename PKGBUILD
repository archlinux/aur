# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

_pkgname=how-to-use-pvs-studio-free
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc='An utility that adds special comments to a source code for analyzing the code by PVS-Studio for free'
arch=('x86_64')
url=https://github.com/viva64/$_pkgname
license=('APACHE')
depends=('gcc-libs')
makedepends=('cmake' 'git')
optdepends=('pvs-studio: for the PVS-Studio code analyzer')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git
        add-comments-to-headers-too.patch)
sha256sums=('SKIP'
            '950a0baf41a1b7cd52a1f207aecf6e9c101eb1865c1490c4bc69fae21ed6da56')

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
