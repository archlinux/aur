# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='3.4.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='fastmcp-slim'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="The dependency-slim FastMCP package."
arch=('any')
url='https://github.com/jlowin/fastmcp'
license=('MIT')

depends=('python' 'python-yaml' 'python-openai' 'python-py-key-value-aio' 'python-jsonschema-path' 'python-pydantic-settings' 'python-rich' 'python-uncalled-for' 'python-pyperclip' 'python-httpx' 'python-pydantic' 'python-platformdirs' 'python-jsonref' 'python-opentelemetry-api' 'python-google-genai' 'python-watchfiles' 'uvicorn' 'python-joserfc' 'python-anyio' 'python-cryptography' 'python-pydantic-core' 'python-mcp' 'python-httpcore' 'python-anthropic' 'python-griffelib' 'python-openapi-pydantic' 'python-exceptiongroup' 'python-typing_extensions' 'python-packaging' 'python-starlette' 'python-authlib' 'python-dotenv' 'python-cyclopts' 'python-cachetools')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz" "LICENSE")
sha256sums=('290646e0955a516235a317151034559aa48336cb843d3f006131aedad8759bb4'
            '43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
