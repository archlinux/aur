# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.4.5
pkgrel=2
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/pypa/pip-audit'
license=('Apache')
depends=(
  'python-cachecontrol'
  'python-cyclonedx-lib'
  'python-dataclasses'
  'python-html5lib'
  'python-lockfile'
  'python-pip-api'
  'python-pip-requirements-parser'
  'python-progress'
  'python-resolvelib'
  'python-rich'
)
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel'
)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a4c5193010ff5f6eced4b66b2151b98b107d7a057d9115e97a6dbd298515d60641d51ad881e268ebe41e01fcc496dc863e043c925d216c898d13c190da28f036')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
