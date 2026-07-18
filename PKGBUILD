# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tqdm
pkgname=pypy3-${_base}
pkgdesc="Fast, Extensible Progress Meter"
pkgver=4.69.0
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MPL-2.0 MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fe2fed3946b564584cd6ffe6c193ada71d744ac1b355b9d47f527759c9747605b9bd47cb244bc43b9522faacdc1f82190a7f3c63e5584083706c4478adf63f37')

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
