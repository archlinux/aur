# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=hexbytes
pkgname=python-${_base}
pkgver=1.3.0
pkgrel=1
pkgdesc="Python bytes subclass that decodes hex, with a readable console output"
arch=(any)
url="https://github.com/ethereum/$_base"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4103f22c00180754ce665bc2d31271ca632d7871cbd54b85c1f9437d9121b7060cf83a979790e2892ce8bd4a16c44d2ea6ad573c0b8325ea71e680523489532b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
