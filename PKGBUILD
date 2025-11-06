# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
_name=tag-expressions
pkgver=8.0.0
pkgrel=1
pkgdesc="Provides a tag-expression parser and evaluation logic for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-uv-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
# checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('519fb8685f7c2d3ee3f973ea7042fa622f4e8260881d91786cf5d3103a88efa8a58ca0f882ad4f82d3cb947b3c913be21d7126677ce0f4ebaac039fe9c04dd15')

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
