# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=python-openapi3
pkgver=1.8.2
pkgrel=1
pkgdesc="A Python3 OpenAPI 3 Spec Parser"
arch=('any')
url=https://github.com/Dorthu/openapi3
license=('BSD-3-Clause')
depends=('python' 'python-pyyaml' 'python-requests')
#checkdepends=('python-pytest' 'uvicorn' 'hypercorn' 'python-starlette' 'python-fastapi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dorthu/openapi3/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('5555ef0495f7d459fabef98c56da4b1b9d758aa06c4dc83adf1388c044dd0f6b09b933e105ef8665737359fbf98b9699ca2d7127ead2aa86e3f99682b29dbf1e')

build() {
    cd "openapi3-$pkgver"
    python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#     cd "openapi3-$pkgver"
#     python -m venv --system-site-packages test-env
#     test-env/bin/python -m installer dist/*.whl
#     PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest
# }

package() {
    cd "openapi3-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
