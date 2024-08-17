# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=hexbytes
pkgname=python-${_base}
pkgver=1.2.1
pkgrel=1
pkgdesc="Python bytes subclass that decodes hex, with a readable console output"
arch=(any)
url="https://github.com/ethereum/$_base"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8f0dbbe57c9829d5cfd4a404c7e18772f12581977562c655ff5b0815c8ce7230dc13e30561a23da2d3dba0dbdac16a9ea24862068b0f50d388e645d03fefefa7')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
