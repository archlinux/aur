# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
_name=tag-expressions
pkgver=6.1.0
pkgrel=1
pkgdesc="Provides a tag-expression parser and evaluation logic for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('304f5da3ca46a214cf15ba93b7e4e89d2387f8c10d48f3eae7708994eb4d32a1e6410c65dd1c5736449e46edcf6050389e1f4e6e7d7acb0b04c2a88924d65ed2')

build() {
    cd "${_name}-${pkgver}/python"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "${_name}-${pkgver}/python"
#     PYTHONPATH="${PWD}" pytest
# }

package() {
    cd "${_name}-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
