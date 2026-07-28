# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=agent-cli
pkgver=0.102.3
pkgrel=1
pkgdesc="A suite of local AI-powered command-line tools"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/agent-cli/'
_url_github='https://github.com/basnijholt/agent-cli'
url="${_url_github}"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-versioningit')
depends=('bash' 'python' 'uvicorn' 'python-onnxruntime' 'python-yaml' 'python-rich' 'python-openai' 'python-pydantic' 'python-httpx' 'python-numpy' 'python-dotenv' 'python-psutil' 'python-huggingface-hub' 'python-pyperclip' 'python-google-genai' 'python-sounddevice' 'python-click' 'python-typer' 'python-fastapi' 'python-watchfiles' 'python-transformers' 'python-wyoming' 'python-pydantic-ai-slim')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a00677e1238daf4d384bc64f5e90f6055be51303998270c5a88f654f583ee5fd')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    rm -rf "${pkgdir}/usr/bin/"{ag,agent}

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
