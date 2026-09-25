# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-aimdo
_name=${pkgname#python-}
_py=cp39
pkgver=0.5.5
pkgrel=1
pkgdesc="AI Model Dynamic Offloader for ComfyUI"
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/comfy-aimdo/"
license=('GPL-3.0')
depends=('python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=(
    'nvidia-utils: CUDA runtime for NVIDIA GPUs'
    'rocm-hip-runtime: ROCm runtime for AMD GPUs'
)

_filename_x86_64=${_name//-/_}-$pkgver-$_py-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.whl
_filename_aarch64=${_name//-/_}-$pkgver-$_py-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.whl
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_x86_64}")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_aarch64}")
noextract=("${_filename_x86_64}" "${_filename_aarch64}")
sha512sums_x86_64=('76171d522a4027ede528b7d8a7a5f78d5c40e4be1f6e632ea101dc670e732e8a55bdb1eaf7428a5eb2caac31332f74b48c6dd5926ca2403607f6fd429f1a4c1c')
sha512sums_aarch64=('395ddef05cc176ab099a809448efad211cdf67cad5865b5a8fd07b9de6c5f49fbbc9f0afc8485348499fe62c236039ba022a8906e43785bc76f8f4c1ff89a0f5')

# build() {
#   cd ${_name//-/_}-${pkgver}
#   python -m build --wheel --no-isolation
# }

package() {
  # cd ${_name//-/_}-${pkgver}
  local _filename
  _filename=${_filename_x86_64}
  [[ "$CARCH" = "aarch64" ]] && _filename=${_filename_aarch64}
  python -m installer --destdir="$pkgdir" "$_filename"
}
