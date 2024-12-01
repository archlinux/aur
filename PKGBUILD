# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
_name=tag-expressions
pkgver=6.1.1
pkgrel=2
pkgdesc="Provides a tag-expression parser and evaluation logic for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
# checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('46247511aec7b5b7206fa88b57f0755225b7983343ecb4b16368322403939cafe40aeea0c4127f3a8d6f4efa7b9a6a67a2eef370d6890de4cb3544b04217fe59')

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
