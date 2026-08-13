# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

package='withoutbg'
pkgname="python-${package}"
pkgdesc="AI-powered background removal with local and cloud options"
pkgver=1.1.1
pkgrel=1

_pypi_package=${package}
_pypi_version=${pkgver}

arch=('any')
license=('Apache-2.0' 'LicenseRef-DINOv3')

_url_github="https://github.com/${package}/${package}"
_url_pypi="https://pypi.org/project/${package}/"
url="https://${package}.com/"

provides=("${_pypi_package}")
depends=('python' 'python-click' 'python-huggingface-hub' 'python-numpy' 'python-onnxruntime' 'python-pillow' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
#source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('15282f880e3853a5100c93a5695de17bd04c91802afd52482863b23934a43b03')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-DINOv3" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-DINOv3"
}
