# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=mivisionx
pkgver=1.8
pkgrel=1
pkgdesc="Set of comprehensive computer vision and machine intelligence
libraries, utilities, and applications bundled into a single toolkit"
arch=('x86_64')
url="https://gpuopen-professionalcompute-libraries.github.io/MIVisionX/"
license=('MIT')
depends=('rocm' 'rocm-cmake' 'miopengemm' 'miopen' 'protobuf' 'opencv' 'ffmpeg')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-ProfessionalCompute-Libraries/MIVisionX/archive/$pkgver.tar.gz")
sha256sums=('edef5fc175211e4da9477b3ca5f453602a77eecda435ecccc63bd06e70d7d00a')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/mivisionx \
        "$srcdir/MIVisionX-$pkgver"
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
