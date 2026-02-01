# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.7.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='rovr'

pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A post-modern terminal file explorer"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/rovr/'
_url_github='https://github.com/NSPC911/rovr'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build')
depends=('python' 'python-textual-autocomplete' 'python-rich' 'python-ujson' 'python-tomli' 'python-pillow' 'python-textual' 'python-jsonschema' 'python-rich-click' 'python-send2trash' 'python-platformdirs' 'python-psutil' 'python-rarfile' 'python-pdf2image' 'python-natsort' 'python-humanize' 'python-textual-image' 'python-pathvalidate')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('540c703b84211cc919524717592a223cd7f4ec87b17d0e55c55dc151f897d8ac')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
