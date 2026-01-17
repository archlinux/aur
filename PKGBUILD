# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='6.0.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='sot'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Command-line System Obervation Tool"
arch=('any')
url='https://github.com/anistark/sot'
license=('MIT')

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-textual' 'python-distro' 'python-psutil' 'python-py-cpuinfo' 'python-rich')

source=("${_pypi_package}-${_upstreamver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e9f5e890ef9523e464419f1fa0ba4f15ae3140686b0505ea87aafae58b93675a')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
