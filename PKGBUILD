# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-debug-agent
pkgver=4.3.1
pkgrel=1
pkgdesc="ROCr Debug Agent Library"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/rocr_debug_agent"
license=('custom:NCSAOSL')
depends=('hip-rocclr' 'rocm-dbgapi' 'glibc')
makedepends=('cmake' 'git')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('7bee6be6c29883f03f47a8944c0d50b7cf43a6b5eeed734602f521c3c40a18d0')
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
