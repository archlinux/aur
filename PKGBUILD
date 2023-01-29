# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=roctracer
pkgver=5.4.2
pkgrel=1
pkgdesc='ROCm tracer library for performance tracing'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Tools/ROCm-Tools.html#amd-rocm-roctracer'
license=('MIT')
depends=('hip' 'rocprofiler')
makedepends=('cmake' 'python-argparse' 'python-cppheaderparser' 'python-ply')
_git='https://github.com/ROCm-Developer-Tools/roctracer'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('13b8c6d1584928ba780b769c177394c6ae0dea7438c7f2f65872f1f0409c3d21')
options=('!lto')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  cmake \
    -B build \
    -Wno-dev \
    -S "$_dirname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DHIP_ROOT_DIR=/opt/rocm/hip
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
