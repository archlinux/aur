# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_upstreamver='1.33.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='moulti'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="CLI-driven Terminal User Interface (TUI) that enables you to assign the numerous lines emitted by your scripts to visual, collapsible blocks called steps"
arch=('any')
url='https://github.com/xavierog/moulti'
license=('MIT')
provides=("moulti")
depends=('bash' 'python' 'python-argcomplete' 'python-pyperclip' 'python-rich' 'python-textual' 'python-typing_extensions' 'python-unidiff' 'ansible-core')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
#checkdepends=('mypy' 'python-pylint' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-forked' 'python-pytest-xdist' 'python-pytest-textual-snapshot')
source=("${_pypi_package}-${_upstreamver}.tar.gz::https://github.com/xavierog/moulti/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a889c50ec031ca2937e1a462d85361c43ecc2c0b618d8dae19613d34b41ad71b')

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
