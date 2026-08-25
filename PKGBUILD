# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="pipelex"
pkgver=0.52.0
pkgrel=1
pkgdesc="Open-source language for AI Agents to create and run repeatable AI workflows"

arch=('any')
license=('MIT')
url='https://github.com/Pipelex/pipelex'

_pypi_package=${pkgname}
_pypi_version=${pkgver}

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-tomlkit' 'python-anthropic' 'python-rich' 'python-instructor' 'python-opentelemetry-sdk' 'python-boto3' 'python-httpcore' 'python-pillow' 'python-pypdfium2' 'python-kajson' 'python-httpx' 'python-typing_extensions' 'python-json2html' 'python-tenacity' 'python-semantic-version' 'python-shortuuid' 'python-polyfactory' 'python-pytest' 'python-google-auth' 'python-annotated-types' 'python-google-genai' 'python-pydantic-core' 'python-aiofiles' 'python-huggingface-hub' 'pipelex' 'python-typer' 'python-opentelemetry-api' 'python-dotenv' 'python-click' 'python-openai' 'python-opentelemetry-semantic-conventions' 'python-yaml' 'python-fal-client' 'python-tomli' 'python-aioboto3' 'python-jinja' 'python-pydantic' 'python-filetype' 'python-botocore' 'python-posthog' 'python-google-api-core' 'python-mthds' 'python-pipelex-tools')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3d19e1da53e6cd6f269cb5ad4edd04a66a382395e2611276633f801b1c15ec84')

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
