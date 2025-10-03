# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='2.12.4'
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
sha256sums=('b55fe89537038f19d0f4476544f9ca5ac171033f61811cc8f12bdeadcbea5016')


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
