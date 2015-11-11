pkgname=cudnn
pkgver=3.0
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('proprietary')
depends=('cuda')
source=()
sha256sums=()

_cudnnSrcDir=""
_cudnnSrcName="cudnn-7.0-linux-x64-v3.0-prod.tgz"
_cudnnSha256="98679d5ec039acfd4d81b8bfdc6a6352d6439e921523ff9909d364e706275c2b"

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
  mkdir -p "${pkgdir}/opt/cuda"
  cp -r cuda "${pkgdir}/opt/cuda"
}

# vim: ft=sh syn=sh et
