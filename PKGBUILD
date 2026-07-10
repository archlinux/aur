# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-angle
_name=${pkgname#python-}
_py=py3
pkgver=0.1.0
pkgrel=1
pkgdesc="Redistributable ANGLE libraries"
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/comfy-angle"
license=('BSD-3-Clause')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)

_filename_x86_64=${_name//-/_}-$pkgver-py3-none-manylinux_2_28_x86_64.whl
_filename_aarch64=${_name//-/_}-$pkgver-py3-none-manylinux_2_28_aarch64.whl
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_x86_64}")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_aarch64}")
noextract=("${_filename_x86_64}" "${_filename_aarch64}")
sha512sums_x86_64=('2344d25a4f13cddfd14d28be902a8bc6cc0d588fc54ffb4bafcd7fac01f65340f8913fcdc149d3d832f171b0f3bba688780c93876a604ee19b266a56eabeff10')
sha512sums_aarch64=('88e2ad0cb18ca8d8be7cbc6801aa8f47e2d984bd5364384c183c5a9ab3a789f0816783db690c3b6420411e055bd2d927191c08262e640071051cd0c6773137ef')

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
