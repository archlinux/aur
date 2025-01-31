# Maintainer: Gustav Åkerström <gustavakerstrom@gmail.com>
# Contributor: Lucas <lucas.biaggi@kde.org>

pkgname=python-taskw-ng
pkgver=0.2.7
pkgrel=2
pkgdesc="Python bindings for your taskwarrior database next generation"
url="https://github.com/bergercookie/taskw-ng/"
depends=("python" "python-pytz" "python-dateutil" "python-kitchen" "task>=2.5")
makedepends=('python' 'python-poetry-core')
provides=('python-taskw_ng')
license=("GPL")
arch=('any')
source=("taskw-ng-${pkgver}.tar.gz::https://github.com/bergercookie/taskw-ng/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6999dfc73b6f9b16ed97cccdd505d724e85f219356c9faa6a62bfee3b4852c7e')

prepare() {
    cp ../pyproject.patch .
    patch -i pyproject.patch -u ${srcdir}/taskw-ng-${pkgver}/pyproject.toml
}

build(){
    cd "${srcdir}/taskw-ng-${pkgver}"
    poetry version ${pkgver}
    python -m build -wn
}

package(){
    PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer -d "${pkgdir}" "${srcdir}/taskw-ng-${pkgver}/dist/taskw_ng-${pkgver}-py3-none-any.whl"
}
