# Maintainer: Joel Jensen <yobert@gmail.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>

_pkgname=timelib
pkgname=python-timelib
pkgver=0.3.0
pkgrel=1
pkgdesc="parse english textual date descriptions"
arch=('x86_64')
url="https://github.com/pediapress/timelib/"
license=('Zlib' 'PHP-3.01')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d1b22706557186e6058da88ba0f85837401b2ae9de157f59353dc978d825187a')

prepare() {
    cd "${_pkgname}-${pkgver}"
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    # This package doesn't seem to have any runnable tests? :'(
    #pytest --noconftest -v # --continue-on-collection-errors || true
    true
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

