# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.5.4
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/srsly'
license=('MIT')
depends=('python' 'python-catalogue')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'cython')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-mock')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/release-v${pkgver}.tar.gz")
sha256sums=('0d88eb579a0c669a78bd43927d1f1bad83a5100c22e01a73f3551b353fb5c008')

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
