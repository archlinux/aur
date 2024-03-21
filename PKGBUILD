# Maintainer: Lucas <lucas.biaggi@kde.org>

pkgname=python-taskw-ng
pkgver=0.2.6
pkgrel=2
pkgdesc="Python bindings for your taskwarrior database next generation"
url="https://github.com/bergercookie/taskw-ng/"
depends=("python" "python-pytz" "python-dateutil" "python-kitchen" "task")
makedepends=('python' 'python-poetry-core')
conflicts=('python-taskw')
provides=('python-taskw=2.1')
replaces=('python-taskw')
license=("GPL")
arch=('any')
source=("taskw-ng-${pkgver}.tar.gz::https://github.com/bergercookie/taskw-ng/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0004525d1d8320a4b606432a7c3db8ff8da102a5d7754474a675596f6ffc0e4f')

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
