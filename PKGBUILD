# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.5.3
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/srsly'
license=('MIT')
depends=('python' 'python-catalogue')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'cython')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-mock')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/release-v${pkgver}.tar.gz")
sha256sums=('1b55f5c3e56d6b312578d09c17337904daaa05e15ffdb208f5e5a41add3fa2b6')

latestver() {
    curl -fsSL 'https://api.github.com/repos/explosion/srsly/releases/latest' |
    jq -r '.tag_name // empty' | sed 's/^release-v//'
}

build() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
