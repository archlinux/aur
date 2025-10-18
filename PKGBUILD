# Maintainer: piernov <piernov@piernov.org>
# Contributor: Stephan Düsterhaupt <me at stephanduesterhaupt dot de>
# Contributor: Ivo Noack <ivo at insonic dot de>

pkgname=cudnn9.10-cuda12.9
pkgver=9.10.2.21
_pkgver=9.10.2
cudaver=12.9
_cudaver=12
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library version 9.10 (Maxwell/Pascal/Volta support)"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('custom')
conflicts=('cudnn')
provides=('cudnn=9.10')
depends=('cuda=12.9')
# To figure out these URLs, check out the Dockerfiles at
# https://gitlab.com/nvidia/container-images/cuda/-/tree/master/dist for the appropriate cuda version
# or make an NVIDIA Developer account.
# Alternatively, check https://github.com/pytorch/builder/blob/master/common/install_cuda.sh
source=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz"
        "NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf")

sha512sums=('3bb42370ea5be3eade3a3203de3d925ed67169e7c019aee9e5c3e9d77422fd2c3e6682ecb7398e4be20d106b9f29ae8ff3adcdba891e129fbb04a441f165713f'
            '38bbb7eb287914e4d7ba79da20a47222382687832d4ba0290715199a129c08715a23681800cf8d381f40e24202470a7b20505a31c8cea51a78762a740860251b')

noextract=("cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz")

package() {
  mkdir -p "${pkgdir}"/usr/share/licenses/
  tar xf cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz --strip-components 1 -C "${pkgdir}/usr"

  #mv "${pkgdir}"/usr/lib64 "${pkgdir}"/usr/lib

  install -Dm644 \
      "${srcdir}"/NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf \
      "${pkgdir}"/usr/share/licenses/${pkgname}/NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf

  mv "${pkgdir}"/usr/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim: ts=2 sw=2 ft=sh syn=sh et
