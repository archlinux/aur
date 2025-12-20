# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.4.1'
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

source=("${_url_github}/releases/download/v${pkgver}/${pkgname}-${pkgver}-py3-none-any.whl"
        "${_url_github}/releases/download/v${pkgver}/${pkgname}_core-${pkgver}-py3-none-any.whl"
        "${_url_github}/releases/download/v${pkgver}/${pkgname}_client-${pkgver}-py3-none-any.whl")
sha256sums=('a29e7f86f544d19a0210fca7dea5ea57dc762586fbe2d79aa464c66876397603'
            '76859faba53d540e4e7755ed82a7fe1e52d8a16e9fce3dfefc750e0bfa8f8746'
            '429b78f4a9cfa2c97ff580440332bf1077dea8f4ed42f0b1663fd5c53517a6ed')


package() {
    for whl in ${source[@]}; do
        whl_bin="$(basename ${whl})"

        msg2 "Compiling ${whl_bin}"
        PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${whl_bin}"
    done

    python -O -m compileall "${pkgdir}"
}
