# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=python-agent-client-protocol
pkgver=0.10.0
pkgrel=1
pkgdesc='Python SDK for ACP clients and agents'
arch=('x86_64')
url='https://github.com/agentclientprotocol/python-sdk'
license=(Apache-2.0)
depends=(
    "python"
    "python-pydantic"
)
makedepends=(
    "python-pdm-backend"
    "python-pytest"
    "python-pytest-asyncio"
    "ruff"
    "python-dotenv"
)
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('c88980f7a8784ee3f6d3a943c82c7a9351180a336542328cf8658a45ae561017')

build() {
    cd "python-sdk"
    python -m build --wheel --no-isolation
}

check() {
    cd "python-sdk"
    #export UV_PYTHON_PREFERENCE=only-system
    uv sync
    uv run python -m pytest --doctest-modules
}

package() {
    cd "python-sdk"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
