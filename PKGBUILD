# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=1.0.1
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/trailofbits/pip-audit'
license=('Apache')
depends=(
  # Upstream requires pip-api >= 0.0.23 but Arch’s Community
  # repository is on 0.0.18, which causes an error message that
  # says “failed to list installed distributions.”
  # Once community/python-pip-api catches up to version 0.0.23,
  # remove the `>=0.0.23` part from the following line.
  'python-pip-api>=0.0.23'
  'python-packaging'
  'python-dataclasses'
  'python-progress'
  # Upstream requires resolvelib >=0.8.0, but extra/python-resolvelib
  # is at 0.5.5 (possibly for compatibility with extra/python-pip
  # 20.3.4). The 0.5.5 version appears to work just fine, so let’s
  # ignore the mismatch.
  'python-resolvelib'
  'python-html5lib'
  'python-cachecontrol'
  'python-lockfile'
  'python-cyclonedx-lib'
)
makedepends=('python-setuptools')
conflicts=('python-pip-audit-git')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trailofbits/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3fed355d1635a12c8e8c7ac1931e9cf1e56076d05f96774feb77ad54f4934d3eb049a6131e5054626c98eb05bd91e44fb159fec9358be0c663944d3cb7c7f595')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
