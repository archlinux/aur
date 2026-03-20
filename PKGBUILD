# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.84.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='agent-cli'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A suite of local AI-powered command-line tools"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/agent-cli/'
_url_github='https://github.com/basnijholt/agent-cli'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-versioningit')
depends=('bash' 'python' 'uvicorn' 'python-onnxruntime' 'python-yaml' 'python-rich' 'python-openai' 'python-pydantic' 'python-httpx' 'python-numpy' 'python-dotenv' 'python-psutil' 'python-huggingface-hub' 'python-pyperclip' 'python-google-genai' 'python-sounddevice' 'python-click' 'python-typer' 'python-fastapi' 'python-watchfiles' 'python-transformers' 'python-wyoming' 'python-pydantic-ai-slim')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c5da49edcba25696343448e45fd10200a56ab7f62b819dfe5d4591872470a45')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    rm -rf "${pkgdir}/usr/bin/"{ag,agent}

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
