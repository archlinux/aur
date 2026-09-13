# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_base=paddlepaddle
pkgname=${_base}-bin
pkgdesc="Parallel Distributed Deep Learning"
pkgver=3.3.1
pkgrel=1
arch=(x86_64)
url="https://${_base}.org.cn"
license=(Apache-2.0)
depends=(python-httpx python-numpy python-protobuf python-pillow python-decorator
  python-opt_einsum python-networkx python-typing_extensions perl)
makedepends=(python-installer)
_pyversion=cp313 # $(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
_wheel="${_base}-${pkgver}-${_pyversion}-${_pyversion}-manylinux1_${CARCH}"
source=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_wheel}.whl)
sha256sums=('4f28038427649bb2fcfd4d52efa85ed8311df19122b4ebedc942484a0b57b032')
noextract=("${_wheel}.whl")
provides=("${_base}=${pkgver}")
conflicts=(${_base})

package() {
  XDG_CACHE_HOME="${PWD}" PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_wheel}.whl
}
