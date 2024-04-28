# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.7.2
pkgrel=2
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
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('81941a94309afbd70b8c5bb11317215d54235b558289709f8e12af97b7a701d8cee6dc488d67ceee4e1852b96d0b064149eaf75cc31616b9846e3c8c5d7b20d9')

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
