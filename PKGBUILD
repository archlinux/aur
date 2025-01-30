# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
_name=tag-expressions
pkgver=6.1.2
pkgrel=1
pkgdesc="Provides a tag-expression parser and evaluation logic for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
# checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a8baea8885047d1d1971f012fda0ffb2b75f1319b39c5ab59be553330ed255a522a7c6bb42971cdefb9fdf5d1c8b08aa280ca76acc767f1233ae8768fffbc5bd')

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
