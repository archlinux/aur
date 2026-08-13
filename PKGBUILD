# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="pipelex"
pkgver=0.43.1
pkgrel=1
pkgdesc="Open-source language for AI Agents to create and run repeatable AI workflows"

arch=('any')
license=('MIT')
url='https://github.com/Pipelex/pipelex'

_pypi_package=${pkgname}
_pypi_version=${pkgver}

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-shortuuid' 'python-pydantic-core' 'python-posthog' 'python-strenum' 'python-anthropic' 'python-pydantic' 'python-fal-client' 'python-yaml' 'python-httpx' 'python-google-auth' 'python-rich' 'python-instructor' 'python-tomli' 'python-kajson' 'python-markdown' 'python-typing_extensions' 'python-dotenv' 'python-aiobotocore' 'python-aioboto3' 'python-filetype' 'python-typer' 'python-yattag' 'python-pillow' 'python-tomlkit' 'python-openai' 'python-json2html' 'python-click' 'python-google-genai' 'python-polyfactory' 'python-boto3' 'python-aiofiles' 'python-pytest' 'python-jinja' 'python-pypdfium2' 'python-mistralai' 'python-networkx')

source=("${_pypi_package}-${_pypi_version}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('adcd5125d6b6128cc7e4e20396ede79a2c5cbcf154cee021ee104bb3f10b7715')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CLA.md" "${pkgdir}/usr/share/doc/${pkgname}/CLA.md"
    install -Dm644 "CLAUDE.md" "${pkgdir}/usr/share/doc/${pkgname}/CLAUDE.md"
    install -Dm644 "AGENTS.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENTS.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
    install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
}
