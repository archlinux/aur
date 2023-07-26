# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.6.1
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
sha512sums=('a909eff2c2f8e16972b37eba8e6fbbb9c68b9bd4fc1593d9963c594fdad5e9616ee53717e476eac8b63849a8af377d28c7f3fb6600b1115724f2b930ac26cd5c')

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
