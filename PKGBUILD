# Maintainer: lalala <lalala_233@qq.com>
_pkgname=python-comfy-kitchen
pkgname=${_pkgname}-cuda
_name=${_pkgname#python-}
_py=cp312
pkgver=0.2.16
pkgrel=1
pkgdesc="Fast kernel library for Diffusion inference with multiple compute backends."
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/comfy-kitchen"
license=('MIT')
depends=('python' 'cuda' 'python-pytorch-cuda')
provides=('python-comfy-kitchen')
conflicts=('python-comfy-kitchen')
makedepends=(python-build python-installer python-wheel python-setuptools)

_filename_x86_64=${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_24_x86_64.manylinux_2_28_x86_64.whl
_filename_aarch64=${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_24_aarch64.manylinux_2_28_aarch64.whl
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_x86_64}")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename_aarch64}")
noextract=("${_filename_x86_64}" "${_filename_aarch64}")
sha512sums_x86_64=('69c3e434bfbccb723ffb149efec7f2b91c5bc7085d056c0c7c8d5e2fd904b49877fe3d49c866b22a8d008ff27477358270d49d83113e5178bb179559c20e645d')
sha512sums_aarch64=('98f0d803a1229a006bc3fbdd3ed7becd5df85cdbd4eb45ec15fef514e2b12a278726199af7f2c8af863d86b9f3ef42c07bdc04edad2ab08b8e3779d0470c6d9f')

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
