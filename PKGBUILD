# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=python-prometheus-fastapi-instrumentator
pkgver=5.8.2
pkgrel=1
pkgdesc="A configurable and modular Prometheus Instrumentator for your FastAPI."
arch=('any')
url="https://github.com/trallnag/prometheus-fastapi-instrumentator"
license=('Apache2')
depends=('python-fastapi' 'python-prometheus_client')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-devtools' 'python-pydantic' 'python-dataclasses' 'python-starlette')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7f78181d8994c982ec5028839e470b570c9c3bd84a1067b6e085aef61d42a5e6')

prepare() {
  cd "prometheus-fastapi-instrumentator-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "prometheus-fastapi-instrumentator-${pkgver}"
  python setup.py build
}

package() {
  cd "prometheus-fastapi-instrumentator-${pkgver}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
