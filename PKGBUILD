
# Maintainer: Adil Alizada <adilalizade13@gmail.com>

pkgname=linear-cli
_pypi_name=linearator
pkgver=1.4.0
pkgrel=1
pkgdesc="A comprehensive CLI tool for Linear issue management with advanced search, bulk operations, and team collaboration features"
arch=('any')
url="https://github.com/AdiKsOnDev/linearator"
license=('MIT')
depends=(
    'python'
    'python-click'
    'python-gql'
    'python-aiohttp'
    'python-pydantic'
    'python-keyring'
    'python-cryptography'
    'python-rich'
    'python-dotenv'
    'python-pyjwt'
    'python-httpx'
    'python-tomli'
    'python-tomli-w'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-keyrings-alt: Alternative keyring backends for credential storage')
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha256sums=('2672b44d8a101c965a1273d6dd8868f17f4f5f418149957f7d71e5decde7908e')

build() {
    cd "$_pypi_name-$pkgver"
    rm -rf dist/  # ensure we are not using prebuilt wheels

    python -m build --skip-dependency-check --wheel --no-isolation
}

check() {
    cd "$_pypi_name-$pkgver"
    echo "Skipping tests (require API access)"
}

package() {
    cd "$_pypi_name-$pkgver"
    # Only install your package files, don't reinstall dependencies
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
