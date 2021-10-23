# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=python-prometheus-fastapi-instrumentator
pkgver=5.7.1
pkgrel=2
pkgdesc="A configurable and modular Prometheus Instrumentator for your FastAPI."
arch=('any')
url="https://github.com/trallnag/prometheus-fastapi-instrumentator"
license=('Apache2')
depends=('python-fastapi' 'python-prometheus_client')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-devtools' 'python-pydantic' 'python-dataclasses' 'python-starlette')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/releases/$pkgver.tar.gz")
sha512sums=('267323d821911acf94b391d90959b5edcd43fedde6b8085f0c0d6b436f5b6ac82288cbb36917e1594761845afd3285e91129038c5997e3ceb279e46f8e509c43')

prepare() {
  cd prometheus-fastapi-instrumentator-releases-"$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd prometheus-fastapi-instrumentator-releases-"$pkgver"
  python setup.py build
}

package() {
  cd prometheus-fastapi-instrumentator-releases-"$pkgver"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}"
  install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
