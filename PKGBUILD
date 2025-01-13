# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_upstreamver='1.29.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='moulti'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="CLI-driven Terminal User Interface (TUI) that enables you to assign the numerous lines emitted by your scripts to visual, collapsible blocks called steps"
arch=('any')
url='https://github.com/napisani/procmux'
license=('MIT')
provides=("moulti")
depends=('python' 'bpython' 'mypy' 'twine' 'python-argcomplete' 'python-pylint' 'python-pyperclip' 'python-textual' 'python-unidiff')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
# checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-forked' 'python-pytest-xdist')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package}/${_pypi_package}-${pkgver}.tar.gz")
sha256sums=('d19371e94892f766db45be09799575708623eb859dbe2a67527423a5d031bf99')

prepare() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"
}

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

#check(){
#    cd "${srcdir}/${_pypi_package}-${pkgver}/"
#
#    PYTHONPATH=src pytest -vv
#}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
