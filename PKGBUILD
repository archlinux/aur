# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="yurijmikhalevich"
pkgname="rclip"
pkgver=3.2.3
pkgrel=1
pkgdesc="AI-Powered Semantic Photo Search for the Command Line"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-pillow' 'python-pillow-heif' 'python-regex' 'python-requests' 'python-tqdm' 'python-huggingface-hub' 'python-numpy' 'python-ftfy' 'python-rawpy')
optdepends=('python-coremltools')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('18dbfb1ae3b6a57e9b093398fc2d490b1bd88f9a8f8f3c44092049cc9122720f')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
