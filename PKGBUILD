# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Maintainer: Anty0 <anty150 at gmail dot com>

# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='4.2.2'
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
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package}/${_pypi_package}-${pkgver}.tar.gz")
sha256sums=('6221d5727d19b4f46fc794635aa00b3dbbab33ed7ff1d686a0011d9197a4b7a0')

prepare() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"
}

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

check(){
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    pytest -vv
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
