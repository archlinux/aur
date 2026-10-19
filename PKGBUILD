# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=serena
pkgver=2.1.0
pkgrel=1
pkgdesc="A powerful MCP server for coding, providing semantic retrieval and editing capabilities. The IDE for your agent."
arch=(any)
url="https://github.com/oraios/serena"
license=("MIT")
depends=(
    "python"
    "python-anthropic"
    "python-beautifulsoup4"
    "python-click"
    "python-cryptography"
    "python-docstring-parser"
    "python-dotenv"
    "python-filelock"
    "python-flask"
    "python-jinja"
    "python-joblib"
    "python-lsprotocol"
    "python-mcp>=2.2.0"
    "python-oslex"
    "python-overrides"
    "python-pathspec"
    "python-pillow"
    "python-psutil"
    "python-pydantic"
    "python-pygls"
    "python-python-multipart"
    "python-pywebview"
    "python-regex"
    "python-requests"
    "python-ruamel-yaml"
    "python-sensai-utils"
    "python-starlette"
    "python-tiktoken"
    "python-tqdm"
    "python-werkzeug"
    "python-yaml"
)
makedepends=("python-hatch" "python-installer")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('44a10afe8f27f5c987daec3b8e50835b7de129ce11073243a69ced76eeb45eda')

build() {
    cd "${pkgname}-${pkgver}"
    hatch build -c -t wheel
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
