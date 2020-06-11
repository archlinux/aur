# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=hip-nvcc
pkgver=3.5.0
pkgrel=1
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/HIP"
license=('MIT')
makedepends=('libelf' 'cmake' 'cuda')
provides=('hip')
conflicts=('hip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm-Developer-Tools/HIP/archive/rocm-$pkgver.tar.gz")
sha256sums=('ae8384362986b392288181bcfbe5e3a0ec91af4320c189bd83c844ed384161b3')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip \
        "$srcdir/HIP-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/hip.conf"
/opt/rocm/hip/lib
EOF
}
