# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
_name=tag-expressions
pkgver=8.1.0
pkgrel=1
pkgdesc="Provides a tag-expression parser and evaluation logic for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-uv-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'uv')
# checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('353025389af9757a2257c2555b83244d65bd66d04000481f696f0313ffe57ad43d49d7439d472dee9063c0c601505566865fbae5ef20a54151453ffd348bbb0b')

build() {
    cd "${_name}-${pkgver}/python"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}/python"
    uv run pytest
}

package() {
    cd "${_name}-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
