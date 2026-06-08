# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="NSPC911"
pkgname="rovr"
pkgver=0.9.1
pkgrel=1
pkgdesc="A post-modern terminal file explorer"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/NSPC911/${_pypi_package}"
url="${_url_github}"

provides=("${_pypi_package}")
conflicts=("${pkgname}"{-bin,-git})

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-textual-autocomplete' 'python-pygments' 'python-rich' 'python-ujson' 'python-tomli' 'python-pillow' 'python-textual' 'python-uvloop' 'python-jsonschema' 'python-fastjsonschema' 'python-rich-click' 'python-send2trash' 'python-platformdirs' 'python-puremagic' 'python-psutil' 'python-rarfile' 'python-pdf2image' 'python-natsort' 'python-humanize' 'python-textual-image' 'python-pathvalidate' 'python-resvg_py' 'python-multiarchive')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('5fd9ecb4c5a06c42288f380b62b5f605fbc8170b1ac4a6cbf49651adc003b3fa')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
