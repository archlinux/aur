# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=2.4.3
pkgrel=2
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/trailofbits/pip-audit'
license=('Apache')
depends=(
  # Upstream requires pip-api >= 0.0.28 but Arch’s Community
  # repository is on 0.0.21, which causes an error message that
  # says “failed to list installed distributions.”
  # Once community/python-pip-api catches up to version 0.0.28,
  # remove the `>=0.0.28` part from the following line.
  'python-pip-api>=0.0.28'
  'python-pip-requirements-parser'
  'python-packaging'
  'python-dataclasses'
  'python-progress'
  'python-resolvelib'
  'python-html5lib'
  # Upstream requires cachecontrol >= 0.12.10 but Arch’s Community
  # repository is at 0.12.6.
  # The 0.12.6 version appears to work just fine, so let’s ignore
  # the mismatch.
  'python-cachecontrol'
  'python-lockfile'
  'python-cyclonedx-lib'
)
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel'
)
conflicts=('python-pip-audit-git')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trailofbits/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('31b8aa10d0ab560bec43d7b77ca04b9262b7e757a01c226cba686a9e6e5bbe397c796f3da45fc57b377a73465e01b9064a4d5dd8b89ecb32589157392f6d8a4c')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
