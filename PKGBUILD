# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='1.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='typio'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Make Your Terminal Type Like a Human"
arch=('any')
url='https://github.com/sepandhaghighi/typio'
license=('MIT')
optdepends=()
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cc8c7b41d9c6ecee0cd0f43f1afda237428dcb299084d18ccb7055d7ae2e2029')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "AUTHORS.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS.md"
    install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
