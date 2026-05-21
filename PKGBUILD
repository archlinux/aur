# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=python-clairvoyance
_pkgname=clairvoyance
pkgver=2.5.5
pkgrel=1
pkgdesc='Obtain GraphQL API schema even if introspection is disabled'
arch=('any')
url='https://github.com/nikitastupin/clairvoyance'
license=('Apache-2.0')
depends=(
    'python'
    'python-aiohttp'
    'python-rich'
)
optdepends=(
    'python-aiodns: DNS resolution speedup for aiohttp'
    'python-brotli: Brotli compression support for aiohttp'
)
makedepends=('python-build' 'python-installer' 'python-poetry-core')
provides=('clairvoyance')
conflicts=('clairvoyance')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5d47d60adf5f43c5d7e99234637b8fa56c45dcb4373081a79b2e093daf707aee')

latestver() {
    curl -fsSL "https://pypi.org/pypi/${_pkgname}/json" |
        python3 -c "import sys,json; print(json.load(sys.stdin)['info']['version'])"
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
