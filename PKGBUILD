# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.9.0
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/pypa/pip-audit'
license=('Apache-2.0')
depends=(
  'python'
  'python-cachecontrol'
  'python-cyclonedx-lib'
  'python-html5lib'
  'python-packaging'
  'python-pip-api'
  'python-pip-requirements-parser'
  'python-platformdirs'
  'python-requests'
  'python-rich'
  'python-toml'
)
checkdepends=('git' 'python-pretend' 'python-pytest')
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
)
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0366031528587a296f9b8b0f8224a29fc5f83ba2f4107e875752752c25ee10705f0cbfe48e11b75198b4e6c80a1ae12f57c2f9cc547930746edf84ed00c15101')

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
