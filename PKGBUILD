# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='1.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='clox'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Geeky Clock for Terminal Enthusiasts"
arch=('any')
url='https://github.com/sepandhaghighi/clox'
license=('BSD-2-Clause')
depends=('python' 'python-pytz' 'python-art' 'python-pytz' 'python-jdatetime' 'python-jalali-core')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-pydocstyle' 'bandit' 'vulture')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('afbdba307f7c3f57d30c81c368514d15bee971f09d29434342b4764b365f0984')


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
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "COUNTRIES.md" "${pkgdir}/usr/share/doc/${pkgname}/COUNTRIES.md"
    install -Dm644 "TIMEZONES.md" "${pkgdir}/usr/share/doc/${pkgname}/TIMEZONES.md"
    install -Dm644 "FACES.md" "${pkgdir}/usr/share/doc/${pkgname}/FACES.md"
}
