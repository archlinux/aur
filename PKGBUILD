# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributer: Carl Smedstad <carsme@archlinux.org>

_upstreamver='1.5.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='toolong'
_execname=tl

pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A terminal log file viewer / tailer / analyzer"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/toolong/'
_url_github='https://github.com/Textualize/toolong'
url="${_url_github}"

provides=("${_execname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-textual' 'python-packaging' 'python-rich' 'python-pyperclip')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
# source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('49934701f954f9701d37381bed6e0f3dfbea0abe1065fcf1ff35de9eef3bbcf3')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
