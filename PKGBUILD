# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-frontend-package
_name=${pkgname#python-}
pkgver=1.52.7
pkgrel=1
pkgdesc="Official front-end implementation of ComfyUI"
arch=('any')
url="https://github.com/Comfy-Org/ComfyUI_frontend/"
license=('GPL-3.0')
depends=('python')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('b8e6b5941dd1dabb64ea7002bc27933c18535d34554810ce0d953dbc889b7c56a45b89e78ae7ded573338b630ea8b1529f1abc520fe192332fdc77d7bb8cfb6e')

build() {
  # See https://github.com/Comfy-Org/ComfyUI_frontend/blob/v1.52.7/comfyui_frontend_package/setup.py
  export COMFYUI_FRONTEND_VERSION=${pkgver}
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
