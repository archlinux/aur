# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.7'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='ipspot'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Python Tool to Fetch the System's IP Address"
arch=('any')
url='https://github.com/bterwijn/invocation_tree'
license=('MIT')
depends=('python' 'python-art' 'python-requests' 'python-urllib3' 'python-certifi' 'python-charset-normalizer' 'python-idna')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('661969a53a7018e4720204897ee680f4ccedb98aeb0fdfac277e4fa4d38a5e89')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "AUTHORS.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS.md"
    install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
