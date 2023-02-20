# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-tcxparser
pkgdesc="Simple parser for Garmin TCX files"
pkgver=2.3.0
pkgrel=1
arch=(any)
url="https://github.com/vkurup/${pkgname}"
license=('custom:BSD-3-clause')
depends=(python-lxml python-dateutil)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('6a145ee69f5398683e15216bcee61bac431aeb03dd3b4e09be075e0543b6b5afdb028757918e73da70d514de727b1c7895496da35f9ee47a7fce371d7397f648')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
