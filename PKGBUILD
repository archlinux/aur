# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.10.0
pkgrel=2
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/pypa/pip-audit'
license=('Apache-2.0')
depends=(
  'python'
  'python-cachecontrol'
  'python-cyclonedx-lib'
  'python-packaging'
  'python-pip-api'
  'python-pip-requirements-parser'
  'python-platformdirs'
  'python-requests'
  'python-rich'
  'python-tomli'
  'python-tomli-w'
)
checkdepends=('git' 'python-pretend' 'python-pytest')
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
)
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('397829c78b2bf01604d5b909a0b5080062a2e7abab790aabf27ca4f366ed148aa167520aa99f1e35a73283d1577be8b85a00f30cc9df2a08e60669fe180d8f97')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
