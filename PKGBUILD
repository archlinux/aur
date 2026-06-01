# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lance-namespace-urllib3-client
_pkgname=lance_namespace_urllib3_client
pkgver=0.7.7
pkgrel=1
pkgdesc="Auto-generated OpenAPI Python client for the Lance Namespace REST API"
arch=('any')
url="https://github.com/lance-format/lance-namespace"
license=('Apache-2.0')
depends=(
    'python'
    'python-urllib3'
    'python-dateutil'
    'python-pydantic'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/$_pkgname/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/lance-format/lance-namespace/main/LICENSE")
sha256sums=('4d8c066628c17c6a10cf643b51a7f7ae1bfb8a614d9cc54a5af38a4ba2b4b102'
            'febc00dc5a0557ca8afbcdc6d3896731dc42f4cecabd87e6c98326212f8dbf36')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    python -c "import lance_namespace_urllib3_client; print('Import successful')"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
