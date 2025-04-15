# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythonocc-core
pkgname=python-${_pkgname#python}
pkgver=7.8.1.1
pkgrel=1
pkgdesc='Python package for 3D geometry CAD/BIM/CAM'
arch=('x86_64')
url='https://github.com/tpaviot/pythonocc-core'
license=('LGPL3')
depends=('python' 'opencascade' 'libxmu' 'libxi' 'python-numpy')
# rapidjson appears to be unused but an opencascade
# header that references it gets dragged in somehow
makedepends=('cmake' 'swig' 'rapidjson' 'git' 'ninja' 'python-setuptools')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
source=("git+https://github.com/tpaviot/pythonocc-core#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd $_pkgname

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHONOCC_MESHDS_NUMPY=ON

  ninja -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install
}
