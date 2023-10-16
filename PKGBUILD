# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tree-sitter-languages
pkgname=python-${_base}-bin
pkgdesc="Python Bindings for Tree Sitter with All Languages"
pkgver=1.8.0
pkgrel=1
arch=('x86_64')
url="https://github.com/grantjenks/py-${_base}"
license=(Apache)
depends=(python-tree-sitter)
makedepends=(python-installer)
provides=(python-${_base}=${pkgver})
conflicts=(python-${_base})
_pyversion=cp311 # $(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
_wheel="${_base//-/_}-${pkgver}-${_pyversion}-${_pyversion}-manylinux_2_17_${CARCH}.manylinux2014_${CARCH}"
source=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_wheel}.whl)
sha512sums=('3837fe523670001843b58e54f3bf06f0ffb72ba4c6f0084e9f9e61c0cbc512ce1487d320b6747bc489f10018fa05ce07987c75a5ed5fe98d9e907a410afdcd51')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ./*.whl
}
