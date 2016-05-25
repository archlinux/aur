# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=cudautils
pkgver=1511
pkgrel=1
pkgdesc="Light-weight library to communicate with the CUDA display driver."
arch=('x86_64')
url="http://developer.nvidia.com/"
license=('MIT')
depends=('cuda')
source=(http://developer.download.nvidia.com/compute/redist/ffmpeg/${pkgver}-patch/cudautils.zip)
sha256sums=('63fc6db4868ea51596f032727fff8cdd43cded54922b45df17a3ed239fc5948e')

build() {
  cd $pkgname

  gcc -c -fPIC -o cudautils.o cudautils.c
  gcc -shared -o libcudautils.so cudautils.o
  ar rcs libcudautils.a cudautils.o
}

package() {
  cd $pkgname
  install -Dm 755 libcudautils.a "$pkgdir/usr/lib/libcudautils.a"
  install -Dm 755 libcudautils.so "$pkgdir/usr/lib/libcudautils.so"
  install -Dm 644 cudautils.h "$pkgdir/usr/include/cudautils.h"
}
