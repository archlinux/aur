# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.15.7'
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
depends=('python' 'python-aiofiles' 'python-markdown' 'python-filetype' 'python-yaml' 'python-jinja' 'python-google-auth' 'python-openai' 'python-rich' 'python-networkx' 'python-posthog' 'python-pillow' 'python-google-genai' 'python-pydantic' 'python-tomlkit' 'python-anthropic' 'python-click' 'python-aioboto3' 'python-typing_extensions' 'python-boto3' 'python-pytest' 'python-tomli' 'python-httpx' 'python-mistralai' 'python-dotenv' 'python-typer' 'python-shortuuid' 'python-polyfactory' 'python-json2html' 'python-yattag' 'python-instructor' 'python-pypdfium2' 'python-kajson')

source=("${_pypi_package}-${_upstreamver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b5ee49aad89e38d9aeffe3f926e463f7c3fa579e5bcf00bd556201b406ebeef7')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "AGENTS.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENTS.md"
    install -Dm644 "CLAUDE.md" "${pkgdir}/usr/share/doc/${pkgname}/CLAUDE.md"
    install -Dm644 "MANIFESTO.md" "${pkgdir}/usr/share/doc/${pkgname}/MANIFESTO.md"
    install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
    install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
}
