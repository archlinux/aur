# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-smi-lib64
pkgver=4.5.2
pkgrel=1
pkgdesc='ROCm System Management Interface Library'
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm_smi_lib"
license=('custom:NCSAOSL')
depends=()
makedepends=('cmake')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/rocm_smi_lib/archive/rocm-$pkgver.tar.gz")
sha256sums=('d4a34db26852defb62817aa44f08ef96d678c63a6f33425bc9d48c18e5e37b7a')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"


build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        "$srcdir/rocm_smi_lib-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_dirname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
