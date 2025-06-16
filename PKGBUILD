# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
_name=tag-expressions
pkgver=6.2.0
pkgrel=1
pkgdesc="Provides a tag-expression parser and evaluation logic for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
# checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('146c2ef1252c160fe77a13b71f374e102d7af674f3f8f63edc71a36cc7ffbc4ba703a2d4c3265e50f158cd66ed9785274d7b4ee60b593bf83145b13732eaf362')

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
