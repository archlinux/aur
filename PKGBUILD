# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="sot"
pkgver=6.3.0
pkgrel=1
pkgdesc="Command-line System Obervation Tool"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

url='https://github.com/anistark/sot'
arch=('any')
license=('MIT')

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-textual' 'python-distro' 'python-psutil' 'python-py-cpuinfo' 'python-rich')

source=("${_pypi_package}-${_upstreamver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e1d64baf37fca73446b1ba8cbd728fe8c7e0aa64f59e75eddb05b32c63c7e6f')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
