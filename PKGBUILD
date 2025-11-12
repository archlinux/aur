# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='1.6'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='samila'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Generative Art Generator"
arch=('any')
url='https://github.com/sepandhaghighi/samila'
license=('MIT')
optdepends=()
depends=('python' 'python-art' 'python-matplotlib' 'python-pillow')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b8fc75ca8204bdcc765a2e18486f2b9fe1956ca21150f52452288df09ff073cd')


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
