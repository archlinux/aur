# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tree-sitter-languages
pkgname=python-${_base}-bin
pkgdesc="Python Bindings for Tree Sitter with All Languages"
pkgver=1.7.0
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
sha512sums=('a950f45cc8fe8cbce38ff1ccb9c3104e16fced8ddc0c0617d15752f647951ddbc3c79edc0f828187e26416a998f19771a0aaecfcfc921b370c6a61a3b8534628')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ./*.whl
}
