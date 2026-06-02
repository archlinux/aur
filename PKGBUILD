# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lance-namespace
_pkgname=lance_namespace
pkgver=0.8.0
pkgrel=1
pkgdesc="Lance Namespace interface and plugin registry"
arch=('any')
url="https://github.com/lance-format/lance-namespace"
license=('Apache-2.0')
depends=(
    'python'
    'python-lance-namespace-urllib3-client'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/$_pkgname/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/lance-format/lance-namespace/main/LICENSE")
sha256sums=('c4a79ee221a3b2315c29863ad12d85fcf219a13158e26149d63e21dc4b4673a7'
            'febc00dc5a0557ca8afbcdc6d3896731dc42f4cecabd87e6c98326212f8dbf36')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    python -c "import lance_namespace; print('Import successful')"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
