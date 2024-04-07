# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythonocc-core
pkgname=python-${_pkgname#python}
pkgver=7.7.2
pkgrel=2
pkgdesc='Python package for 3D CAD/BIM/PLM/CAM'
arch=('x86_64')
url='https://github.com/tpaviot/pythonocc-core'
license=('LGPL3')
depends=('python' 'opencascade' 'libxmu' 'libxi')
# rapidjson appears to be unused but an opencascade
# header that references it gets dragged in somehow
makedepends=('cmake' 'swig' 'rapidjson' 'git' 'ninja')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
source=("git+https://github.com/tpaviot/pythonocc-core#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd $_pkgname

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  ninja -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install
}
