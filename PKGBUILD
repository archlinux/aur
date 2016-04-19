# Maintainer: Benjamin Chrétien <chretien dot b +aur at gmail dot com>
pkgname=cudnn
pkgver=5.0.4
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('proprietary')
depends=('cuda')
source=()
sha256sums=()

_cudnnSrcDir=""
_cudnnSrcName="cudnn-7.5-linux-x64-v5.0-rc.tgz"
_cudnnSha256="320d54ab31dd7e1eb57a5fe054fe44143483afe851c900ebe9bb016f61f4519a"

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
