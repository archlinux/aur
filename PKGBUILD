# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tqdm
pkgname=pypy3-${_base}
pkgdesc="Fast, Extensible Progress Meter"
pkgver=4.67.3
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MPL-2.0 MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7bdcc7f4d894b789f1458319641d2067cb836ed06a679b552fc2a99629044c858b9f28ae6f369565e3f7bde918d211991b9c1ee84cc0fdd6d534a2dd71318eec')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/usr/bin"
  mv "${pkgdir}/opt/pypy3/bin/tqdm" "${pkgdir}/usr/bin/tqdm-pypy3"
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
