# Maintainer: envolution
# Contributor: Jean-Gabriel Young <info@jgyoung.ca>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-httpstan
_pkgname=httpstan
pkgver=4.13.0
pkgrel=3
pkgdesc="HTTP-based REST interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='https://httpstan.readthedocs.org'
license=(LicenseRef-ISCL)
depends=(python-numpy python-marshmallow python-webargs python-setuptools python-appdirs python-aiohttp)
makedepends=(python-poetry python-build python-installer python-wheel python-setuptools python-poetry-core)
source=("$pkgname-$pkgver.tar.gz::https://github.com/stan-dev/httpstan/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6b15a07557715e79e6fd66993930003b270f8b8b0c9e65f84978afe5e6bb3047')

build() {
  cd $_pkgname-$pkgver
  make
  poetry build -v --no-interaction
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
}
# vim:set ts=2 sw=2 et:
