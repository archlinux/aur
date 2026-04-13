# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.0.3'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='withoutbg'

pkgname="python-${_pypi_package}"
pkgdesc="AI-powered background removal with local and cloud options"
pkgver="${_upstreamver}"
pkgrel=1

arch=('any')
_url_pypi='https://pypi.org/project/withoutbg/'
_url_github='https://github.com/withoutbg/withoutbg'
url='https://withoutbg.com/'
license=('Apache-2.0')

provides=("${_pypi_package}")
depends=('python' 'python-click' 'python-huggingface-hub' 'python-numpy' 'python-onnxruntime' 'python-pillow' 'python-requests' 'python-tqdm')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
#source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f3197ea8c62bdf146f1146ad5941532f70b4d74f3d02d82cc5b51797642001b')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
