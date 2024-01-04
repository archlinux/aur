# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tree-sitter-languages
pkgname=python-${_base}-bin
pkgdesc="Python Bindings for Tree Sitter with All Languages"
pkgver=1.9.1
pkgrel=1
arch=(x86_64)
url="https://github.com/grantjenks/py-${_base}"
license=(Apache)
depends=(python-tree-sitter)
makedepends=(python-installer)
provides=(python-${_base}=${pkgver})
conflicts=(python-${_base})
_pyversion=cp311 # $(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
_wheel="${_base//-/_}-${pkgver}-${_pyversion}-${_pyversion}-manylinux_2_17_${CARCH}.manylinux2014_${CARCH}"
source=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_wheel}.whl)
sha512sums=('4511e97630a0e063693142dbaef901273b794dc6822c1531d6424f50db737d7666b9a7e5fbd90f7675768c5e5c6c1f2cd364e00cef68ce55be9c103a969bf0af')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ./*.whl
}
