# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tqdm
pkgname=pypy3-${_base}
pkgdesc="Fast, Extensible Progress Meter"
pkgver=4.67.2
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MPL-2.0 MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('94589716b9bd5fe8df9e3008a32099c8759d85d03226aa61d9154a34932a53c1d7038975e1ceeb64b8531a1f66c259a9fc30b9854e05ba6808b06b94c1c81c2d')

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
