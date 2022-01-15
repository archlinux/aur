# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=1.1.2
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/trailofbits/pip-audit'
license=('Apache')
depends=(
  # Upstream requires pip-api >= 0.0.26 but Arch’s Community
  # repository is on 0.0.18, which causes an error message that
  # says “failed to list installed distributions.”
  # Once community/python-pip-api catches up to version 0.0.26,
  # remove the `>=0.0.26` part from the following line.
  'python-pip-api>=0.0.26'
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
sha512sums=('bc77a98d11ac3733427d31ed5cfcebafcbb41e73289702a1ad7f2dfb603e3bf6a82f9e81a556824eb0dd22ef45027c22d53678b01dbd6e371bf0a4324ef76bea')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
