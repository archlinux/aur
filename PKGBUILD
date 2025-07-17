# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_upstreamver='2.3'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='mytimer'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Geeky Timer for Terminal Enthusiasts"
arch=('any')
url='https://github.com/sepandhaghighi/mytimer'
license=('MIT')
depends=('python' 'python-nava' 'python-art' 'python-jdatetime')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('21de1eda4a9a6e9dbc999d559c7f6e002f0904d2b190999dbb5c077ea2a9d110')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "AUTHORS.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS.md"
    install -Dm644 "FACES.md" "${pkgdir}/usr/share/doc/${pkgname}/FACES.md"
    install -Dm644 "PROGRAMS.md" "${pkgdir}/usr/share/doc/${pkgname}/PROGRAMS.md"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
    install -Dm644 "TONES.md" "${pkgdir}/usr/share/doc/${pkgname}/TONES.md"
}
