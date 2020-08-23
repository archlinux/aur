# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=migraphx
pkgver=3.7.0
_pkgver=0.7
pkgrel=1
pkgdesc="AMD's graph optimization engine"
arch=('x86_64')
url="https://rocmsoftwareplatform.github.io/AMDMIGraphX/doc/html/"
license=('MIT')
depends=('rocm-cmake' 'miopen' 'hip' 'protobuf' 'half' 'pybind11')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCmSoftwarePlatform/AMDMIGraphX/archive/$_pkgver.tar.gz")
sha256sums=('697c3c7babaa025eaabec630dbd8a87d10dc4fe35fafa3b0d3463aaf1fc46399')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/migraphx \
        "$srcdir/AMDMIGraphX-$_pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in migraphx; do
    ln -s "/opt/rocm/migraphx/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
