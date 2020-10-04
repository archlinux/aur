# Maintainer: Kostas Georgiadis <kot+aur at cons dot gr>

pkgname=cudnn
pkgver=7.6.5.32
_pkgver=7.6.5
_cudaver=10.1
_majorver=7
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('custom')
depends=('cuda-10.1')
# To figure out these URLs, check out the Dockerfiles at
# https://gitlab.com/nvidia/container-images/cuda/-/tree/master/dist for the appropriate cuda version
# or make an NVIDIA Developer account.
# Alternatively, check https://github.com/pytorch/builder/blob/master/common/install_cuda.sh
source=("https://developer.download.nvidia.com/compute/redist/cudnn/v${_pkgver}/cudnn-${_cudaver}-linux-x64-v${pkgver}.tgz"
        "NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf")
sha512sums=('1073bc42c2c36fce6b710882a04a4035d66d95c410200b9d50953e993d7b801cc3a837e42843ad2447e62ea5dfc8ba22c8a803464716c56ffb811aa278645771'
            '38bbb7eb287914e4d7ba79da20a47222382687832d4ba0290715199a129c08715a23681800cf8d381f40e24202470a7b20505a31c8cea51a78762a740860251b')
noextract=("cudnn-${_cudaver}-linux-x64-v${pkgver}.tgz")

package() {
  mkdir -p "${pkgdir}"/usr/share/licenses/
  tar xf cudnn-${_cudaver}-linux-x64-v${pkgver}.tgz --strip-components 1 -C "${pkgdir}/usr"

  mv "${pkgdir}"/usr/lib64 "${pkgdir}"/usr/lib

  install -Dm644 \
      "${srcdir}"/NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf \
      "${pkgdir}"/usr/share/licenses/${pkgname}/NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf

  mv "${pkgdir}"/usr/NVIDIA_SLA_cuDNN_Support.txt "${pkgdir}"/usr/share/licenses/${pkgname}/NVIDIA_SLA_cuDNN_Support.txt
}

# vim: ts=2 sw=2 ft=sh syn=sh et
