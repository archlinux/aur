# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=migraphx
pkgver=4.3.1
pkgrel=1
pkgdesc="AMD's graph optimization engine"
arch=('x86_64')
url="https://rocmsoftwareplatform.github.io/AMDMIGraphX/doc/html/"
license=('MIT')
depends=('rocm-cmake' 'miopen' 'hip-rocclr' 'protobuf' 'msgpack-c' 'blaze')
makedepends=('cmake' 'nlohmann-json' 'half' 'pybind11')
_git='https://github.com/ROCmSoftwarePlatform/AMDMIGraphX'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('e0b04da37aed937a2b2218059c189559a15460c191b5e9b00c7366c81c90b06e')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  cmake -Wno-dev -B build \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        "$srcdir/AMDMIGraphX-rocm-$pkgver"
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
