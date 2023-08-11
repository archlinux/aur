# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=python-openapi3
pkgver=1.8.1
pkgrel=1
pkgdesc="A Python3 OpenAPI 3 Spec Parser"
arch=('any')
url=https://github.com/Dorthu/openapi3
license=('BSD3')
depends=('python' 'python-pyyaml' 'python-requests')
#checkdepends=('python-pytest' 'uvicorn' 'hypercorn' 'python-starlette' 'python-fastapi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dorthu/openapi3/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('30e9ca405d36cefd68be4c8c9761e3e1d63c552e29fdfcefbec97646713631df656055e4dded9fdaf510140b1f4f731edecee8ef45a0092e0644a2701fda0872')

build() {
    cd "openapi3-$pkgver"
    python -m build --wheel --skip-dependency-check --no-isolation
}

#check() {
#    cd "openapi3-$pkgver"
#    python -m venv --system-site-packages test-env
#    test-env/bin/python -m installer dist/*.whl
#    PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest
#}

package() {
    cd "openapi3-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
