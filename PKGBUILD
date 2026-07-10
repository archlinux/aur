# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-aimdo
_name=${pkgname#python-}
_py=cp39
pkgver=0.4.10
pkgrel=1
pkgdesc="AI Model Demand Offloading Allocator"
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/comfy-aimdo/"
license=('GPL-3.0')
depends=('python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=(
    'nvidia-utils: CUDA runtime for NVIDIA GPUs'
    'rocm-hip-runtime: ROCm runtime for AMD GPUs'
)

_filename_x86_64=${_name//-/_}-$pkgver-cp39-abi3-manylinux2010_x86_64.manylinux2014_x86_64.manylinux_2_12_x86_64.manylinux_2_17_x86_64.whl
_filename_aarch64=${_name//-/_}-$pkgver-cp39-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.whl
source_x86_64=("https://files.pythonhosted.org/packages/cp39/${_name::1}/$_name/${_filename_x86_64}")
source_aarch64=("https://files.pythonhosted.org/packages/cp39/${_name::1}/$_name/${_filename_aarch64}")
noextract=("${_filename_x86_64}" "${_filename_aarch64}")
sha512sums_x86_64=('683846cb562ab7864b1aa0f11d4fd28279b9d907c379279cf0dd451327f7efef29021e21d3b4e14fa584e63b049e99042278b1f0562195b16cb795058d34d213')
sha512sums_aarch64=('247163f777734e30dbd43e26e3220dcec7a3f50f283ad1414bc72489e58ba3f86828db399453160a2e9c945da13b93d35ce7d1dc55462c593273aba0addf7742')

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
