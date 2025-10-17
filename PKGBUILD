# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='2.12.5'
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
depends=('python' 'uvicorn' 'python-httpx' 'python-pydantic' 'python-pydantic-core' 'python-pydantic-settings' 'python-openai' 'python-openapi-pydantic' 'python-jsonschema-path' 'python-pyperclip' 'python-cryptography' 'python-mcp' 'python-authlib' 'python-starlette' 'python-rich' 'python-typing_extensions' 'python-anyio' 'python-dotenv')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('2dfd02e255705a4afe43d26caddbc864563036e233dbc6870f389ee523b39a6a')


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
    install -Dm644 "README_OPENAPI.md" "${pkgdir}/usr/share/doc/${pkgname}/README_OPENAPI.md"
    install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
}
