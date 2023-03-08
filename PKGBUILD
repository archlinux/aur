# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=weblate_schemas
pkgname=python-weblate_schemas
pkgver=2023.2
pkgrel=1
pkgdesc="Schemas used in Weblate"
url="https://github.com/WeblateOrg/weblate_schemas"
depends=('python' 'python-jsonschema' 'python-strict-rfc3339' 'python-rfc3987' 'python-fqdn')
checkdepends=('python-pytest')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://github.com/WeblateOrg/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('513312709c6da605d71bba7902ac8a5ed6da760ba31a50f30168589bb36242a5')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pytest
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
