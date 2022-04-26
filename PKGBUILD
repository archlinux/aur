# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='3.3.6'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='greenery'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Greenery allows manipulation of regular expressions as finite state machines"
arch=('any')
url='https://github.com/qntm/greenery'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package}/${_pypi_package}-${pkgver}.tar.gz")
sha256sums=('e53fce6023b2ae9aca9481ca751354d21fc61ffe490a589221c25c01b1daa8e2')

prepare() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"
}

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"
    python -m build --wheel --no-isolation
    #python setup.py build
}

check(){
    cd "${srcdir}/${_pypi_package}-${pkgver}/"
    pytest
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"
    python -m installer --destdir="$pkgdir" dist/*.whl
    #python setup.py install --root="${pkgdir}" --optimize=1
}
