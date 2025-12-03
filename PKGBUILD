# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.0.2'
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
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
#source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a035fc2026e75c6b9ca9b4cf630ad0e52207df69b4a5d1d1f4d6b81c92b2ea6a')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
