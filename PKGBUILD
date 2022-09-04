# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=weblate_schemas
pkgname=python-weblate_schemas
pkgver=2022.1
pkgrel=2
pkgdesc="Schemas used in Weblate"
url="https://github.com/WeblateOrg/weblate_schemas"
depends=('python' 'python-jsonschema' 'python-strict-rfc3339' 'python-rfc3987' 'python-fqdn')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/WeblateOrg/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('28d6896cb430a2aefd9ef28e002736fc27f8b12f6e777cc3b5971d15b4ebd431')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pytest
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
