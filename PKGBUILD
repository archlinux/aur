# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=cudnn-pascal
pkgver=9.10.2.21
_cudaver=12
pkgrel=1
pkgdesc="NVIDIA cuDNN library for Pascal GPUs (CUDA 12.x; pinned to latest Pascal-supported cuDNN)"
arch=("x86_64")
url="https://developer.nvidia.com/cuDNN"
license=(LicenseRef-NVIDIA-cuDNN)
depends=(
  cuda-pascal
  glibc
  gcc-libs
  zlib
  'libz.so'
)
provides=("cudnn")
conflicts=("cudnn")
options=(!strip)
source=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz")
b2sums=('17d56a2e459df88a7ae6c27c1edc093c3b58e6732e49d001d277e159ff90face0b722db9edd089bf36383dd4f48e225582583e2fbf52fae134787349bfda19c6')

package() {
  cd "cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive"

  mkdir -p "$pkgdir/usr"
  cp -rv lib include "$pkgdir/usr"

  # remove static libs
  rm "$pkgdir/usr/lib"/*.a

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et
