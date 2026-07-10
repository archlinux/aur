# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-frontend-package
_name=${pkgname#python-}
pkgver=1.45.20
pkgrel=1
pkgdesc="Official front-end implementation of ComfyUI"
arch=('any')
url="https://github.com/Comfy-Org/ComfyUI_frontend/"
license=('GPL-3.0')
depends=('python')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('7303fdd9e435dcdf10397c399231bdec2e143206ca0111822c6f479e9e6c6678d6b96ff8365559db9d6dfe76029bc019b539c93a5d1d99a4ea8edb9fb4bc3831')

build() {
  export COMFYUI_FRONTEND_VERSION=${pkgver}
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
