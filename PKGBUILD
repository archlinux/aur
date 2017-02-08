# Maintainer: Benjamin Chrétien <chretien dot b +aur at gmail dot com>
pkgname=cudnn
pkgver=5.1.10
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('proprietary')
depends=('cuda')
source=()


_cudnnSrcDir="$(realpath .)"
_cudnnSrcName="cudnn-8.0-linux-x64-v5.1.tgz"
_cudnnSha256="c10719b36f2dd6e9ddc63e3189affaa1a94d7d027e63b71c3f64d449ab0645ce"

prepare() {
  echo "###################################################################"
  echo "# cuDNN is only available to registered CUDA developers.          #"
  echo "# Register on the website, and download the cuDNN source tarball. #"
  echo "###################################################################"
  echo

  while [ ! -f "${_cudnnSrcDir}/${_cudnnSrcName}" ]; do
    echo "Error: ${_cudnnSrcName} not found in $(realpath ${_cudnnSrcDir})"
    echo -n "Enter the directory containing the cuDNN source tarball ${_cudnnSrcName}: "
    read _cudnnSrcDir
  done

  # Check for file validity
  sha256sum -c <(printf "${_cudnnSha256}  ${_cudnnSrcDir}/${_cudnnSrcName}\n") || return 1

  # Untar
  mkdir -p "${srcdir}/${pkgname}-${pkgver}"
  tar -xzvf "${_cudnnSrcDir}/${_cudnnSrcName}" -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/opt"
  cp -r cuda "${pkgdir}/opt"
}

# vim: ft=sh syn=sh et




