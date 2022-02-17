# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-smi-lib64
pkgver=5.0.1
pkgrel=1
pkgdesc='ROCm System Management Interface Library'
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm_smi_lib"
license=('custom:NCSAOSL')
depends=()
makedepends=('cmake' 'doxygen' 'texlive-latexextra')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/rocm_smi_lib/archive/rocm-$pkgver.tar.gz")
sha256sums=('bf0beb092522ef06f94e7763217678ec6cba160ace1de3e1e0a61bf4ae251135')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"


build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # build type Release fixes warnings regarding FORTIFY_SOURCE
  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_BUILD_TYPE=Release \
        "$srcdir/rocm_smi_lib-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_dirname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
