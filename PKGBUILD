# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.17.3'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='pipelex'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Open-source language for AI Agents to create and run repeatable AI workflows"
arch=('any')
url='https://github.com/Pipelex/pipelex'
license=('MIT')

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-shortuuid' 'python-pydantic-core' 'python-posthog' 'python-strenum' 'python-anthropic' 'python-pydantic' 'python-fal-client' 'python-yaml' 'python-httpx' 'python-google-auth' 'python-rich' 'python-instructor' 'python-tomli' 'python-kajson' 'python-markdown' 'python-typing_extensions' 'python-dotenv' 'python-aiobotocore' 'python-aioboto3' 'python-filetype' 'python-typer' 'python-yattag' 'python-pillow' 'python-tomlkit' 'python-openai' 'python-json2html' 'python-click' 'python-google-genai' 'python-polyfactory' 'python-boto3' 'python-aiofiles' 'python-pytest' 'python-jinja' 'python-pypdfium2' 'python-mistralai' 'python-networkx')

source=("${_pypi_package}-${_upstreamver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0c0b4ca483d9d701a0626c46669418e39ed1690405ea24d8be1edf009289526')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CLA.md" "${pkgdir}/usr/share/doc/${pkgname}/CLA.md"
    install -Dm644 "CLAUDE.md" "${pkgdir}/usr/share/doc/${pkgname}/CLAUDE.md"
    install -Dm644 "AGENTS.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENTS.md"
    install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
    install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
}
