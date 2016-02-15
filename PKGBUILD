# Maintainer: Benjamin Chrétien <chretien dot b +aur at gmail dot com>
pkgname=cudnn
pkgver=4.0
pkgrel=2
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('proprietary')
depends=('cuda')
source=()
sha256sums=()

_cudnnSrcDir=""
_cudnnSrcName="cudnn-7.0-linux-x64-v4.0-prod.tgz"
_cudnnSha256="4e64ef7716f20c87854b4421863328e17cce633330c319b5e13809b61a36f97d"

prepare() {
  echo "###################################################################"
  echo "# cuDNN is only available to registered CUDA developers.          #"
  echo "# Register on the website, and download the cuDNN source tarball. #"
  echo "###################################################################"
  echo
  echo -n "Enter the directory containing the cuDNN source tarball ${_cudnnSrcName}: "
  read _cudnnSrcDir

  # Check for file existence
  if [[ -f "${_cudnnSrcDir}/${_cudnnSrcName}" ]]; then
    # Check for file validity
    sha256sum -c <(printf "${_cudnnSha256}  ${_cudnnSrcDir}/${_cudnnSrcName}\n") || return 1

    # Untar
    mkdir -p "${srcdir}/${pkgname}-${pkgver}"
    tar -xzvf "${_cudnnSrcDir}/${_cudnnSrcName}" -C "${srcdir}/${pkgname}-${pkgver}"
  else
    echo "Error: ${_cudnnSrcName} not found in ${_cudnnSrcDir}"
    return 1
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/opt"
  cp -r cuda "${pkgdir}/opt"
}

# vim: ft=sh syn=sh et
