# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.6.2
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/pypa/pip-audit'
license=('Apache')
depends=(
  'python-cachecontrol'
  'python-cyclonedx-lib'
  'python-html5lib'
  'python-lockfile'
  'python-pip-api'
  'python-pip-requirements-parser'
  'python-progress'
  'python-requests'
  'python-rich'
  'python-toml'
  'python-urllib3'
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
sha512sums=('197a5159425cb891c8e6e5c3e0d662d03b3949b04a5c5b71665ba61c983a02db01dc6a51186fbf4b70fc4013d8cfaab0a2b6d08a9d2c6dc68e8b1b7df8936c22')

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
