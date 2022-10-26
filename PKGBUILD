# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.4.4
pkgrel=1
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
  # Upstream requires pip-api >= 0.0.28 but Arch’s Community
  # repository is on 0.0.25, which causes an error message that
  # says “failed to list installed distributions.”
  # Once community/python-pip-api catches up to version 0.0.28,
  # remove the `>=0.0.28` part from the following line.
  'python-pip-api>=0.0.28'
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
conflicts=('python-pip-audit-git')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4f381ee67a08c02ec54ac63dc2c14b064f3669bfed119ddfa0957f66fffa55bbe7f87ab362f8acf412a2a29be167a2d9542ba7190c4ad63a8d312469265ba100')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
