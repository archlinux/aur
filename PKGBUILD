# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=mivisionx
pkgver=3.9.0
pkgrel=1
pkgdesc="Set of comprehensive computer vision and machine intelligence
libraries, utilities, and applications bundled into a single toolkit"
arch=('x86_64')
url="https://gpuopen-professionalcompute-libraries.github.io/MIVisionX/"
license=('MIT')
depends=('rocm' 'rocm-cmake' 'miopengemm' 'miopen' 'protobuf' 'opencv' 'ffmpeg')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-ProfessionalCompute-Libraries/MIVisionX/archive/rocm-$pkgver.tar.gz")
sha256sums=('892812cc6e6977ed8cd4b69c63f4c17be43b83c78eeafd9549236c17f6eaa2af')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/mivisionx \
        "$srcdir/MIVisionX-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in mivisionx; do
    ln -s "/opt/rocm/mivisionx/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
