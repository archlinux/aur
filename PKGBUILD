# Maintainer: envolution
# Contributor: Jean-Gabriel Young <info@jgyoung.ca>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-httpstan
_pkgname=httpstan
pkgver=4.13.0
pkgrel=2
pkgdesc="HTTP-based REST interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='https://httpstan.readthedocs.org'
license=(ISCL)
depends=(python-numpy python-marshmallow python-webargs python-setuptools python-appdirs python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools python-poetry-core)
checkdepends=(python-apispec python-sphinx_rtd_theme)
source=("$pkgname-$pkgver.tar.gz::https://github.com/stan-dev/httpstan/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6b15a07557715e79e6fd66993930003b270f8b8b0c9e65f84978afe5e6bb3047')

build() {
  cd $_pkgname-$pkgver
  make
  python -m poetry build
  #python -m build --wheel --no-isolation
}

#check() {
#  cd $_pkgname-$pkgver
# python -m pytest -s -v tests
# tests work, but a not of them need disabling due to external services
#}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
}
# vim:set ts=2 sw=2 et:
