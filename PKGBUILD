# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=hexbytes
pkgname=python-${_base}
pkgver=1.3.1
pkgrel=1
pkgdesc="Python bytes subclass that decodes hex, with a readable console output"
arch=(any)
url="https://github.com/ethereum/$_base"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('621c3aaa5d9782f2d78b7d80ed78e7f0d94b7b8222beda498cc5eb18f15a9048fb9718c536aa834efe251dbf5ed80097ce09c00cdfa235fd3ee7505efd39e570')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
