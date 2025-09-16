# Maintainer: Adil Alizada <adilalizade13@gmail.com>

pkgname=linear-cli
_pypi_name=linearator
pkgver=1.3.0
pkgrel=1
pkgdesc="A comprehensive CLI tool for Linear issue management with advanced search, bulk operations, and team collaboration features"
arch=('any')
url="https://github.com/AdiKsOnDev/linearator"
license=('MIT')
depends=(
    'python>=3.12'
    'python-httpx'
    'python-keyring'
    'python-tomli-w'
    'python-dotenv'
    'python-pydantic'
    'python-rich'
    'python-pygments'
    'python-secretstorage'
    'python-typing_extensions'
)
depends+=('python-gql')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    'keyrings.alt: Alternative keyring backends for credential storage'
)
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha256sums=('8c157c3d509572a2cd92b75f68c2303d3334366bd8e73c7756f668175e71558a')

build() {
    cd "$_pypi_name-$pkgver"
    python -m build --wheel
}

check() {
    cd "$_pypi_name-$pkgver"
    # Skip tests during package build - they require API access and coverage setup
    echo "Tests skipped during package build"
}

package() {
    cd "$_pypi_name-$pkgver"
    
    # Install the built wheel
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license and docs from source
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
