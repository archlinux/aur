# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-debug-agent
pkgver=5.0.0
pkgrel=1
pkgdesc="ROCr Debug Agent Library"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/rocr_debug_agent"
license=('custom:NCSAOSL')
depends=('hip' 'rocm-dbgapi' 'glibc')
makedepends=('cmake' 'git')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('fb8ebe136bfa815116453bdcb4afb9617ab488f54501434c72eed9706857be3f')
_dirname="$(basename "$url")-$(basename "${source[0]}" ".tar.gz")"

build() {
  cmake -Wno-dev -S "$_dirname" \
        -DCMAKE_HIP_ARCHITECTURES='gfx900;gfx906;gfx908' \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm
  make
}

package() {
  make DESTDIR="$pkgdir" install
}
