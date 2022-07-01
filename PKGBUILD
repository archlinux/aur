# Maintainer: Lorenzo Gaifas <brisvag@gmail.com>

_name='justpy'
_author='elimintz'
_framework='python'
pkgname="${_framework}-${_name}"
pkgver=0.2.3
pkgrel=1
pkgdesc="An object oriented high-level Python Web Framework that requires no front-end programming"
arch=('any')
license=('Apache')
url="https://justpy.io/"
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-flit-core'
)
depends=(
  'python'
  'python-addict'
  'python-aiofiles'
  'python-demjson3'
  'python-httpx'
  'python-itsdangerous'
  'python-jinja'
  'python-starlette'
  'python-websockets'
  'uvicorn'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8db66276af9c2e5c52a496b3ac111f77e5c4e0b259e71582e290bb2782a8c1ab')
provides=("${_framework}-${_name}")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
