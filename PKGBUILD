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
sha512sums=('b70e13c22bd3d0cc028890daa1d03304db8c48d0101214102b3b170c936bf30ff5d114f0534fee1c0d04913b13ccfb3e6e028c2ff10c8d6fd5b4c7b0ad03d048')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
