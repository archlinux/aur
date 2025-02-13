# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_upstreamver='1.32.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='moulti'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=2
pkgdesc="CLI-driven Terminal User Interface (TUI) that enables you to assign the numerous lines emitted by your scripts to visual, collapsible blocks called steps"
arch=('any')
url='https://github.com/xavierog/moulti'
license=('MIT')
provides=("moulti")
depends=('bash' 'ansible-core' 'python' 'bpython' 'mypy' 'twine' 'python-argcomplete' 'python-pylint' 'python-pyperclip' 'python-rich' 'python-textual' 'python-typing_extensions' 'python-unidiff' 'python-ansible-compat')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
#checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-forked' 'python-pytest-xdist' 'python-pytest-textual-snapshot')
source=("https://github.com/xavierog/moulti/archive/refs/tags/v1.32.0.tar.gz")
sha256sums=('91ca969ae85d186dc19d30b34a603b3d09d7677a513d4b466d2eb9a41ce82aa0')

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
#    PYTHONPATH=src pytest tests -vv
#}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
