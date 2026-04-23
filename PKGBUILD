# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='2.6'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='mytimer'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Geeky Timer for Terminal Enthusiasts"
arch=('any')
url='https://github.com/sepandhaghighi/mytimer'
license=('MIT')

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
depends=('python' 'python-nava' 'python-art' 'python-jdatetime' 'python-colorama')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('8cdf37bc369f9674f711caaf5e67077a7589dc70ddfc18048dec460199415d27')


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
