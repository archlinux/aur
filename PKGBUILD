# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.8.2.post2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='rovr'

pkgname="${_pypi_package}"
pkgver="${_upstreamver%%.post*}"
pkgrel=4
pkgdesc="A post-modern terminal file explorer"

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/NSPC911/${_pypi_package}"
url="${_url_github}"

provides=("${_pypi_package}")
conflicts=("${pkgname}"{-bin,-git})

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-textual-autocomplete' 'python-pygments' 'python-rich' 'python-ujson' 'python-tomli' 'python-pillow' 'python-textual' 'python-jsonschema' 'python-fastjsonschema' 'python-rich-click' 'python-send2trash' 'python-platformdirs' 'python-puremagic' 'python-psutil' 'python-rarfile' 'python-pdf2image' 'python-natsort' 'python-humanize' 'python-textual-image' 'python-pathvalidate' 'python-resvg_py')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_upstreamver}.tar.gz")
# source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${_upstreamver}.tar.gz")
sha256sums=('d8c2bfd8bbfb6c3aeacc1bb480a66c005a5a242a8434f58f5d8920091e5588ba')

build() {
    cd "${srcdir}/${_pypi_package}-${_upstreamver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_upstreamver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
