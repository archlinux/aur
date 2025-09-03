# Maintainer: Stephan Düsterhaupt <me at stephanduesterhaupt dot de>
# Maintainer: Ivo Noack <ivo at insonic dot de>

pkgname=cudnn9.3-cuda12.5
pkgver=9.3.0.75
_pkgver=9.3.0
cudaver=12.5
_cudaver=12
_majorver=8
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('custom')
conflicts=('cudnn')
depends=('cuda=12.5')
# To figure out these URLs, check out the Dockerfiles at
# https://gitlab.com/nvidia/container-images/cuda/-/tree/master/dist for the appropriate cuda version
# or make an NVIDIA Developer account.
# Alternatively, check https://github.com/pytorch/builder/blob/master/common/install_cuda.sh
source=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz"
        "NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf")

sha512sums=('a5bde12da001a0ee30d4a00db70de0fd8f783e35e22c9d10cef56a7d034da27eb79a5fe5493498289d0062c70a7168709ec797e6b87f1bfe79c737c22d0ccb7f'
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
