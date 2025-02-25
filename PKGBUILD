# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_upstreamver='1.32.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='moulti'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=3
pkgdesc="CLI-driven Terminal User Interface (TUI) that enables you to assign the numerous lines emitted by your scripts to visual, collapsible blocks called steps"
arch=('any')
url='https://github.com/xavierog/moulti'
license=('MIT')
provides=("moulti")
depends=('bash' 'python' 'python-argcomplete' 'python-pyperclip' 'python-rich' 'python-textual' 'python-typing_extensions' 'python-unidiff' 'ansible-core')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
#checkdepends=('mypy' 'python-pylint' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-forked' 'python-pytest-xdist' 'python-pytest-textual-snapshot')
source=("${_pypi_package}-${_upstreamver}.tar.gz::https://github.com/xavierog/moulti/archive/refs/tags/v1.32.0.tar.gz")
sha256sums=('91ca969ae85d186dc19d30b34a603b3d09d7677a513d4b466d2eb9a41ce82aa0')

#prepare() {
#    cd "${srcdir}/${_pypi_package}-${pkgver}/"
#}

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
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "Documentation.md" "${pkgdir}/usr/share/doc/${pkgname}/DOCUMENTATION.md"
}
