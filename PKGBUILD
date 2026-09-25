# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-angle
_name=${pkgname#python-}
_py=py3
pkgver=0.1.1
pkgrel=1
pkgdesc="Redistributable ANGLE libraries"
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/comfy-angle"
license=('BSD-3-Clause')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)

_filename_x86_64=${_name//-/_}-$pkgver-$_py-none-manylinux_2_28_x86_64.whl
_filename_aarch64=${_name//-/_}-$pkgver-$_py-none-manylinux_2_28_aarch64.whl
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_x86_64}")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_aarch64}")
noextract=("${_filename_x86_64}" "${_filename_aarch64}")
sha512sums_x86_64=('9651af04c37ba19ed93838152ed86f0e8f0b36ef1d0d88ef20d4b08dd37356d14c89152b02bf2d80fd426eae5c07cbb0d9161e39f321296f26719a48971c1b05')
sha512sums_aarch64=('eae4155aebb1f087d8f488c6a7415e8645da9a164b0ecb4a942206f330aac8995afc693f44f4cadc17e7c01a226e462bcf160267b0ae38626b6a4ec16c5e4144')

# build() {
#   cd ${_name//-/_}-${pkgver}
#   python -m build --wheel --no-isolation
# }

package() {
  local _filename
  [[ "$CARCH" = "x86_64" ]] && _filename=${_filename_x86_64}
  [[ "$CARCH" = "aarch64" ]] && _filename=${_filename_aarch64}
  python -m installer --destdir="$pkgdir" "$_filename"
}
