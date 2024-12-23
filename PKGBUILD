# Maintainer: envolution
# Contributor: Jean-Gabriel Young <info@jgyoung.ca>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-mistral-common
_pkgname=mistral-common
pkgver=1.5.1
pkgrel=2
pkgdesc="set of tools to help you work with Mistral models"
arch=('x86_64')
url='https://pypi.org/project/mistral-common'
license=()
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/7c/f9/ed2dc1801908c42a64bb02f3ad353eeb2f281f587515c226428a0deba45b/mistral_common-${pkgver}.tar.gz")
sha256sums=('6f2cc0209baeadc31f78c2275bddb734f167ad1734c8c8596f5338786c594537')

build() {
  cd "mistral_common-${pkgver}"
  #python -m poetry build
  python -m build --wheel --no-isolation
}

#check() {
#  cd $_pkgname-$pkgver
# python -m pytest -s -v tests
# tests work, but a not of them need disabling due to external services
#}

package() {
  cd "mistral_common-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
