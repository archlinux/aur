# Maintainer: envolution
# Contributor: Jean-Gabriel Young <info@jgyoung.ca>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-mistral-common
_pkgname=mistral-common
pkgver=1.5.4
pkgrel=3
pkgdesc="set of tools to help you work with Mistral models"
arch=('x86_64')
url='https://pypi.org/project/mistral-common'
license=('Apache-2.0')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-poetry
  python-setuptools
)
source=("https://files.pythonhosted.org/packages/source/m/mistral-common/mistral_common-${pkgver}.tar.gz")

sha256sums=('0af4124ab09d1409761e91ec61681476882d46f9418eea8908d39c01222e0f6b')

build() {
  cd "mistral_common-${pkgver}"
  python -m build --wheel --no-isolation
}

#check() {
#  cd $_pkgname-$pkgver
# python -m pytest -s -v tests
# tests work, but a lot of them need disabling due to external services
#}

package() {
  cd "mistral_common-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
