# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.7.1
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/pypa/pip-audit'
license=('Apache-2.0')
depends=(
  'python-cachecontrol'
  'python-cyclonedx-lib'
  'python-html5lib'
  'python-pip-api'
  'python-pip-requirements-parser'
  'python-requests'
  'python-rich'
  'python-toml'
)
checkdepends=('git' 'python-pretend' 'python-pytest')
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel'
)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b4bb1bd14e27c168ecaa47f0a74c671a6ad24f349c922eeaeaafc7a9846a3fa7f0e10ad5cf6a2adc3f98bed5908e7e231ac7542a44b5762ee5bf14863f54f537')

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
