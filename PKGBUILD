# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: rosetintedcheeks <oaks at rosetintedcheeks dot com>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

## GPG key: https://github.com/jsirois.gpg

pkgname=python-pex
pkgver=2.100.4
pkgrel=1
arch=(any)
pkgdesc='Generates executable Python environments'
url='https://docs.pex-tool.org/'
license=(Apache-2.0)
depends=(python)
makedepends=(git python-build python-installer python-uv python-uv-build python-setuptools)
# checkdepends=(python-pytest python-coloredlogs python-dateutil python-psutil python-yaml)
changelog=CHANGES.md
provides=(pex)
replaces=(pex)
source=("$pkgname::git+https://github.com/pex-tool/pex#tag=v$pkgver?signed")
validpgpkeys=(A1FE765B15233EAD18FA6ABB93E55CB567B5C626)
sha256sums=('9044368a2de348baed10c7c1dfd847521098f7e841c2160efa78fee8f0088d6a')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "$pkgname"
#     python -m venv --system-site-packages test-env
#     test-env/bin/python -m installer dist/*.whl
#     test-env/bin/python -P testing/bin/run_tests.py
# }

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}
