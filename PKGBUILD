# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cucumber-tag-expressions
_name=tag-expressions
pkgver=11.0.1
pkgrel=1
pkgdesc="Provides a tag-expression parser and evaluation logic for cucumber/behave"
url="https://github.com/cucumber/tag-expressions"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-uv-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'uv')
# checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a0b97a3b22a13c7d7965d75a14abadba7dc61a92104b9ec9c7e68d7062557164adc9d3c201c704635fc04b294d0148be93e5f749b2baae4bab7cde69299d3cce')

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
