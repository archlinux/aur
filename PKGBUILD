# Maintainer: lalala <lalala_233@qq.com>
_pkgname=python-comfy-kitchen
pkgname=${_pkgname}-cuda
_name=${_pkgname#python-}
_py=cp312
pkgver=0.2.35
pkgrel=1
pkgdesc="Fast Kernel Library for ComfyUI with multiple compute backends"
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/comfy-kitchen"
license=('MIT')
depends=('python' 'cuda' 'python-pytorch-cuda')
provides=("python-comfy-kitchen=$pkgver")
conflicts=('python-comfy-kitchen')
makedepends=(python-build python-installer python-wheel python-setuptools)

_filename_x86_64=${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
_filename_aarch64=${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_26_aarch64.manylinux_2_28_aarch64.whl
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_x86_64}")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_aarch64}")
noextract=("${_filename_x86_64}" "${_filename_aarch64}")
sha512sums_x86_64=('23e5d1ec9833d89c21c3529e4d2c9e0f7d0e0837ec27641e88d4bfc609023c4c11aa6d686ade62e774593c99228dce1775666c147c7d9acf65d2465ce72a1133')
sha512sums_aarch64=('508a9c857f6e4052beada0b00000f0387e001c1f59c6ddc8649a9a6ef375daac0fe5c647c049d57d783735127a2882a8b35263ecf85fc8c03f9440c41003a793')

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
