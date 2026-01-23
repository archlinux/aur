# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='2.14.4'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='fastmcp'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="The fast, Pythonic way to build MCP servers and clients."
arch=('any')
url='https://github.com/jlowin/fastmcp'
license=('MIT')

depends=('python' 'uvicorn' 'python-dotenv' 'python-pydantic-settings' 'python-pydantic' 'python-authlib' 'python-cryptography' 'python-rich' 'python-openai' 'python-httpx' 'python-pydantic-core' 'python-starlette' 'python-typing_extensions' 'python-anyio' 'python-pyperclip' 'python-exceptiongroup' 'python-openapi-pydantic' 'python-mcp' 'python-jsonschema-path')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling' 'python-uv-dynamic-versioning')
optdepends=()

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('c01f19845c2adda0a70d59525c9193be64a6383014c8d40ce63345ac664053ff')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "AGENTS.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENTS.md"
    install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
    install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
}
