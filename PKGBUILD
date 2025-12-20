# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.3.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='gundog'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A fast semantic search and retrieval engine"

license=('GPL-3.0')
arch=('any')

_url_pypi='https://pypi.org/project/gundog'
_url_github='https://github.com/adhityaravi/gundog'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('uvicorn' 'python' 'python-rich' 'python-urllib3' 'python-requests' 'python-numpy' 'python-httpx' 'python-yaml' 'python-pyaml' 'python-typer' 'python-tqdm' 'python-pathspec' 'python-fastapi' 'python-huggingface-hub' 'python-onnxruntime' 'python-optimum' 'python-optimum-onnx' 'python-transformers' 'python-sentence-transformers' 'python-hnswlib' 'python-rank-bm25')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6dba5250f945f67364a2f53e276123eeeda66f9ee975621b2be219d24b6891f6')

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
