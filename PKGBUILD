# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=serena
pkgver=1.7.0
pkgrel=1
pkgdesc="A powerful MCP server for coding, providing semantic retrieval and editing capabilities. The IDE for your agent."
arch=(any)
url="https://github.com/oraios/serena"
license=("MIT")
depends=(
    "python"
    "python-anthropic"
    "python-beautifulsoup4"
    "python-cryptography"
    "python-docstring-parser"
    "python-dotenv"
    "python-filelock"
    "python-flask"
    "python-jinja"
    "python-joblib"
    "python-lsprotocol"
    "python-mcp"
    "python-oslex"
    "python-overrides"
    "python-pathspec"
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
sha256sums=('7eea6098b959b16fec12693ee27f214ab6769e68a2c7e33f4b8c0ca349eac125')

build() {
    cd "${pkgname}-${pkgver}"
    hatch build -c -t wheel
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
