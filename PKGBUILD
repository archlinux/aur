# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.1.20'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='lic-cli'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="CLI Tool for Managing Licenses For Your Codebase"

license=('GPL-3.0-or-later')
arch=('any')

_url_pypi='https://pypi.org/project/lic-cli/'
_url_github='https://github.com/kushvinth/lic'
url="${_url_github}"

provides=("${_pypi_package%%-cli}")
depends=('python' 'python-rich' 'python-httpx' 'python-questionary')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/kushvinth/lic/refs/heads/main/LICENSE")
sha256sums=('9cf768d68a8a2b6482741f3b2991000529606bbd716da77c12b082245907807c'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
